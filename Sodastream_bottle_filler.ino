/*
    The MIT License (MIT)

    Copyright (c) 2022 by Yves Parent

    Permission is hereby granted, free of charge, to any person obtaining a copy
    of this software and associated documentation files (the "Software"), to deal
    in the Software without restriction, including without limitation the rights
    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
    copies of the Software, and to permit persons to whom the Software is
    furnished to do so, subject to the following conditions:
    The above copyright notice and this permission notice shall be included in all
    copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
    SOFTWARE.
*/

#include <EEPROM.h>

#define pin_valve           7
#define pin_btn             3
#define pin_sensor          2
#define pin_LED             5
#define pin_buzzer          6

#define filter_treshold     5
#define longpress_treshold  600
#define double_press_time   600
#define timeout             120000

#define shortPress  0
#define longPress   1
#define progMode    2

#define minVol      50 //minimum number of pulses stored in EEPROM

#define eeAddress   20 //address in EEPROM where number of pulses is stored

int pulse_count;

volatile int IRQcount = 0;

boolean btn_pressed = false;
boolean btn_prev = false;
boolean prev_inputRead = false;
int filter_high = 0;
int filter_low = 0;
unsigned long btn_timestamp;
unsigned long progmode_timestamp;
unsigned long btn_release_timestamp;

boolean short_press_flag = false;
boolean long_press_flag = false;
boolean prog_mode_flag = false;
boolean prog_mode_window_flag = true;
boolean first_release_flag = true;
boolean valve_active = false;
int btn_mode = shortPress;


int flProgMode = 2500; //LED blink length program mode
int flShortPress = 10000; //LED blink length Short press
int flashcounter = 0;
boolean flashonoff = true;
//---------------------------------------------------------------------------------------------------------------------//

void IRQcounter() //flow sensor interrupt
{
  IRQcount++;
}

//---------------------------------------------------------------------------------------------------------------------//

void setup() {
  // initialize input/output pins
  pinMode(pin_valve, OUTPUT);
  pinMode(pin_LED, OUTPUT);
  pinMode(pin_buzzer, OUTPUT);
  pinMode(pin_btn, INPUT_PULLUP);
  pinMode(pin_sensor, INPUT_PULLUP);

  // read number of pulses from EEPROM
  EEPROM.get(eeAddress, pulse_count);

  //if the value is too low or something goes wrong,
  //the pulss_count is set to the minimum value to prevent
  //immediate closing of the valve after pressing the button.
  //This would leave no time to reprogram the value.

  if (pulse_count < minVol) pulse_count = minVol;
}

//---------------------------------------------------------------------------------------------------------------------//

void loop() {
  InputFilter(); //filter the button presses to prevent button bouncing
  btnLogic(); //detect short press, long press and double press and hold
  counterLogic(); //count the flow sensor pulses when needed
  OutputValve(); //open or close the water valve when needed
  OutputLED(); //handle the feedback LED (on/off/blinking)
}

//---------------------------------------------------------------------------------------------------------------------//

int read_count() { // safely read flow sensor count
  noInterrupts () ;
  int result = IRQcount ;
  interrupts () ;
  return result ;
}

//---------------------------------------------------------------------------------------------------------------------//

void InputFilter() {
  boolean inputRead = !digitalRead(pin_btn);

  if (inputRead == prev_inputRead) {
    if (inputRead) filter_high++;
    if (!inputRead) filter_low++;
  }
  if (inputRead != prev_inputRead) {
    filter_high = 0;
    filter_low = 0;
  }

  if (filter_high == filter_treshold) {
    filter_high = filter_treshold;
    btn_pressed = true;
  }
  if (filter_low == filter_treshold) {
    filter_low = filter_treshold;
    btn_pressed = false;
  }
  prev_inputRead = inputRead;
}

//---------------------------------------------------------------------------------------------------------------------//

void OutputLED() {
  if (valve_active) { //if water is running
    switch (btn_mode) { //check mode
      case shortPress: //blink LED slowly
        flashcounter++;
        if (flashcounter >= flShortPress) { 
          flashonoff = !flashonoff; 
          flashcounter = 0; 
          digitalWrite(pin_LED, flashonoff); 
        }
        break;
      case longPress: //LED on
        digitalWrite(pin_LED, 1);
        break;
      case progMode: //blink LED fast
        flashcounter++;
        if (flashcounter >= flProgMode) { 
          flashonoff = !flashonoff; 
          flashcounter = 0; 
          digitalWrite(pin_LED, flashonoff);
        }
        break;
      default:
        break;
    }

  } else { //if no water is running, turn LED off
    digitalWrite(pin_LED, 0);
  }
}

//---------------------------------------------------------------------------------------------------------------------//

void btnLogic() {
  unsigned long curMillis = millis();

  // short press
  if (btn_pressed && !btn_prev) {
    if (valve_active) {
      if (!prog_mode_window_flag)
        resetValve();
      resetCount();
    } else {
      short_press_flag = true;
      btn_timestamp = curMillis;
      valve_active = true;
      attachInterrupt(digitalPinToInterrupt(pin_sensor), IRQcounter, RISING);
      btn_mode = shortPress;
      tone(pin_buzzer, 2500, 150); //short press single beep
    }
  }

  //long press
  if (valve_active && btn_pressed && short_press_flag && curMillis - btn_timestamp > longpress_treshold && !long_press_flag) {
    long_press_flag = true;
    btn_mode = longPress;
    resetCount();
    tone(pin_buzzer, 2500, 100); 	//long press double beep
    delay(120);
    tone(pin_buzzer, 2500, 100);
  }

  //long press progMode
  if (btn_pressed && !btn_prev && valve_active) {
    progmode_timestamp = curMillis;
  }

  if (valve_active && btn_pressed && !short_press_flag && !long_press_flag && !prog_mode_flag && curMillis - progmode_timestamp > longpress_treshold) {
    prog_mode_flag = true;
    btn_mode = progMode;
    tone(pin_buzzer, 2000, 200); //enter progMode low high beep
    delay(100);
    tone(pin_buzzer, 3000, 200);
  }

  //release while in programming mode
  if (!btn_pressed && btn_prev && prog_mode_flag) {
    resetValve();
    int new_pulse_count = read_count();
    resetCount();
    if (new_pulse_count < minVol) new_pulse_count = minVol;

  
    while (1) {
      EEPROM.put(eeAddress, new_pulse_count); // store new pulse count in EEPROM...
      EEPROM.get(eeAddress, pulse_count);     // ...and check the stored value
      if (new_pulse_count == pulse_count) {
        break;
      } else { //something went wrong, wait and retry
        delay(500);
      }
    }

    tone(pin_buzzer, 3000, 200); //exit progMode high low beep
    delay(100);
    tone(pin_buzzer, 2000, 200);
  }



  //when button is released
  if (!btn_pressed && btn_prev) {
    btn_release_timestamp = curMillis;
    if (first_release_flag) {
      first_release_flag = false;
    } else {
      if (prog_mode_window_flag) {
        resetValve();
        resetCount();
      }
    }
  }


  //safety timeout for long press switch
  if (valve_active && curMillis - btn_timestamp > timeout) {
    resetValve(); //safety broken switch
    resetCount();
  }

  //while button is not pressed
  if (!btn_pressed) {
    short_press_flag = false;
    long_press_flag = false;
    prog_mode_flag = false;
    
    //check if the timeout for the double press for programming has expired
    if (curMillis - btn_release_timestamp > double_press_time) {
      prog_mode_window_flag = false;
    }
  }

  btn_prev = btn_pressed;

}

//---------------------------------------------------------------------------------------------------------------------//

void counterLogic() {
  if (btn_mode == shortPress && valve_active) {
    int count = read_count() ;  // read the current count
    if (count >= pulse_count) {
      resetValve();
      resetCount();
    }
  }
}

//---------------------------------------------------------------------------------------------------------------------//

void resetCount() {
  detachInterrupt(digitalPinToInterrupt(pin_sensor));
  IRQcount = 0;//reset interrupt counter
}

//---------------------------------------------------------------------------------------------------------------------//

void resetValve() {
  valve_active = false;
  btn_mode = shortPress;
  first_release_flag = true;
  tone(pin_buzzer, 1800, 100); //valve closed confirmation low beep
}

//---------------------------------------------------------------------------------------------------------------------//

void OutputValve() {
  if (valve_active) {
    digitalWrite(pin_valve, HIGH);
  } else {
    digitalWrite(pin_valve, LOW);
  }
}
