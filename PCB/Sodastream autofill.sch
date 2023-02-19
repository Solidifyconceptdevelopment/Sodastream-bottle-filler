EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "Sodastream autofill controller"
Date "2022-10-15"
Rev "1.0"
Comp "Solidify"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L MCU_Module:Arduino_Nano_v2.x A1
U 1 1 634A7D91
P 4600 3600
F 0 "A1" H 3850 4550 50  0000 C CNN
F 1 "Arduino_Nano_v2.x" H 3850 4650 50  0000 C CNN
F 2 "Module:Arduino_Nano" H 4600 3600 50  0001 C CIN
F 3 "https://www.arduino.cc/en/uploads/Main/ArduinoNanoManual23.pdf" H 4600 3600 50  0001 C CNN
	1    4600 3600
	1    0    0    -1  
$EndComp
$Comp
L Connector:Barrel_Jack_Switch J1
U 1 1 634A9882
P 1750 3700
F 0 "J1" H 1807 4017 50  0000 C CNN
F 1 "Barrel_Jack" H 1807 3926 50  0000 C CNN
F 2 "Connector_BarrelJack:BarrelJack_Horizontal" H 1800 3660 50  0001 C CNN
F 3 "~" H 1800 3660 50  0001 C CNN
	1    1750 3700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0101
U 1 1 634AA568
P 2500 3900
F 0 "#PWR0101" H 2500 3650 50  0001 C CNN
F 1 "GND" H 2505 3727 50  0000 C CNN
F 2 "" H 2500 3900 50  0001 C CNN
F 3 "" H 2500 3900 50  0001 C CNN
	1    2500 3900
	1    0    0    -1  
$EndComp
$Comp
L power:+12V #PWR0102
U 1 1 634AAB78
P 2450 3600
F 0 "#PWR0102" H 2450 3450 50  0001 C CNN
F 1 "+12V" V 2465 3728 50  0000 L CNN
F 2 "" H 2450 3600 50  0001 C CNN
F 3 "" H 2450 3600 50  0001 C CNN
	1    2450 3600
	0    1    1    0   
$EndComp
Wire Wire Line
	2050 3800 2150 3800
Wire Wire Line
	2150 3800 2150 3900
$Comp
L Isolator:4N37 U1
U 1 1 634AE0C0
P 9550 4200
F 0 "U1" H 9550 4525 50  0000 C CNN
F 1 "4N37" H 9550 4434 50  0000 C CNN
F 2 "Package_DIP:DIP-6_W7.62mm" H 9350 4000 50  0001 L CIN
F 3 "https://www.vishay.com/docs/81181/4n35.pdf" H 9550 4200 50  0001 L CNN
	1    9550 4200
	-1   0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 634AFEBF
P 7350 4600
F 0 "R1" H 7420 4646 50  0000 L CNN
F 1 "10k" H 7420 4555 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 7280 4600 50  0001 C CNN
F 3 "~" H 7350 4600 50  0001 C CNN
	1    7350 4600
	1    0    0    -1  
$EndComp
$Comp
L Device:R R2
U 1 1 634B03E2
P 9950 4550
F 0 "R2" H 10020 4596 50  0000 L CNN
F 1 "470" H 10020 4505 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 9880 4550 50  0001 C CNN
F 3 "~" H 9950 4550 50  0001 C CNN
	1    9950 4550
	1    0    0    -1  
$EndComp
$Comp
L Device:D D1
U 1 1 634B0794
P 6700 3900
F 0 "D1" H 6700 4117 50  0000 C CNN
F 1 "D" H 6700 4026 50  0000 C CNN
F 2 "Diode_THT:D_A-405_P7.62mm_Horizontal" H 6700 3900 50  0001 C CNN
F 3 "~" H 6700 3900 50  0001 C CNN
	1    6700 3900
	1    0    0    -1  
$EndComp
$Comp
L Connector:Screw_Terminal_01x02 J5
U 1 1 634B1F37
P 8850 4200
F 0 "J5" H 8768 3875 50  0000 C CNN
F 1 "LED OUT" H 8768 3966 50  0000 C CNN
F 2 "TerminalBlock_Phoenix:TerminalBlock_Phoenix_MKDS-1,5-2-5.08_1x02_P5.08mm_Horizontal" H 8850 4200 50  0001 C CNN
F 3 "~" H 8850 4200 50  0001 C CNN
	1    8850 4200
	-1   0    0    1   
$EndComp
$Comp
L Connector:Screw_Terminal_01x02 J2
U 1 1 634B26AB
P 6050 2700
F 0 "J2" H 5968 2375 50  0000 C CNN
F 1 "Button IN" H 5968 2466 50  0000 C CNN
F 2 "TerminalBlock_Phoenix:TerminalBlock_Phoenix_MKDS-1,5-2-5.08_1x02_P5.08mm_Horizontal" H 6050 2700 50  0001 C CNN
F 3 "~" H 6050 2700 50  0001 C CNN
	1    6050 2700
	-1   0    0    1   
$EndComp
$Comp
L Device:Buzzer BZ1
U 1 1 634B5023
P 7200 2650
F 0 "BZ1" H 7205 2940 50  0000 C CNN
F 1 "Buzzer" H 7205 2849 50  0000 C CNN
F 2 "Buzzer_Beeper:MagneticBuzzer_ProSignal_ABT-410-RC" V 7175 2750 50  0001 C CNN
F 3 "~" V 7175 2750 50  0001 C CNN
	1    7200 2650
	-1   0    0    -1  
$EndComp
$Comp
L power:+12V #PWR0103
U 1 1 634BC737
P 4500 2600
F 0 "#PWR0103" H 4500 2450 50  0001 C CNN
F 1 "+12V" H 4515 2773 50  0000 C CNN
F 2 "" H 4500 2600 50  0001 C CNN
F 3 "" H 4500 2600 50  0001 C CNN
	1    4500 2600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0104
U 1 1 634BD284
P 7400 2750
F 0 "#PWR0104" H 7400 2500 50  0001 C CNN
F 1 "GND" H 7405 2577 50  0000 C CNN
F 2 "" H 7400 2750 50  0001 C CNN
F 3 "" H 7400 2750 50  0001 C CNN
	1    7400 2750
	1    0    0    -1  
$EndComp
$Comp
L Device:Q_NMOS_GDS Q1
U 1 1 634AF76F
P 7150 4300
F 0 "Q1" H 7355 4346 50  0000 L CNN
F 1 "Q_NMOS_GDS" H 7355 4255 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Vertical" H 7350 4400 50  0001 C CNN
F 3 "~" H 7150 4300 50  0001 C CNN
	1    7150 4300
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR0105
U 1 1 634C0707
P 7050 5050
F 0 "#PWR0105" H 7050 4800 50  0001 C CNN
F 1 "GND" H 7055 4877 50  0000 C CNN
F 2 "" H 7050 5050 50  0001 C CNN
F 3 "" H 7050 5050 50  0001 C CNN
	1    7050 5050
	1    0    0    -1  
$EndComp
Wire Wire Line
	7050 4500 7050 4900
Wire Wire Line
	7350 4300 7350 4450
Wire Wire Line
	7350 4750 7350 4900
Wire Wire Line
	7350 4900 7050 4900
Connection ~ 7050 4900
Wire Wire Line
	7050 4900 7050 5050
Wire Wire Line
	7050 4100 7050 4000
$Comp
L power:+12V #PWR0106
U 1 1 634C2441
P 6500 3550
F 0 "#PWR0106" H 6500 3400 50  0001 C CNN
F 1 "+12V" H 6515 3723 50  0000 C CNN
F 2 "" H 6500 3550 50  0001 C CNN
F 3 "" H 6500 3550 50  0001 C CNN
	1    6500 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	6350 4000 6850 4000
$Comp
L Connector:Screw_Terminal_01x02 J3
U 1 1 634B15BD
P 6150 4000
F 0 "J3" H 6068 3675 50  0000 C CNN
F 1 "Valve OUT" H 6068 3766 50  0000 C CNN
F 2 "TerminalBlock_Phoenix:TerminalBlock_Phoenix_MKDS-1,5-2-5.08_1x02_P5.08mm_Horizontal" H 6150 4000 50  0001 C CNN
F 3 "~" H 6150 4000 50  0001 C CNN
	1    6150 4000
	-1   0    0    1   
$EndComp
Wire Wire Line
	6500 3550 6500 3900
Wire Wire Line
	6500 3900 6350 3900
Wire Wire Line
	6550 3900 6500 3900
Connection ~ 6500 3900
Wire Wire Line
	6850 3900 6850 4000
Connection ~ 6850 4000
Wire Wire Line
	6850 4000 7050 4000
Wire Wire Line
	7700 4300 7350 4300
Connection ~ 7350 4300
Text GLabel 7400 2550 2    50   Input ~ 0
buzzer
Text GLabel 4100 3600 0    50   Input ~ 0
buzzer
Text GLabel 4100 3700 0    50   Input ~ 0
Solenoid
Text GLabel 7700 4300 2    50   Input ~ 0
Solenoid
Wire Wire Line
	7400 2750 7300 2750
$Comp
L Connector:Conn_01x03_Male J4
U 1 1 634B3CAD
P 8200 2600
F 0 "J4" H 8308 2881 50  0000 C CNN
F 1 "Flow sensor" H 8308 2790 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 8200 2600 50  0001 C CNN
F 3 "~" H 8200 2600 50  0001 C CNN
	1    8200 2600
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0107
U 1 1 634D312A
P 4800 2600
F 0 "#PWR0107" H 4800 2450 50  0001 C CNN
F 1 "+5V" H 4815 2773 50  0000 C CNN
F 2 "" H 4800 2600 50  0001 C CNN
F 3 "" H 4800 2600 50  0001 C CNN
	1    4800 2600
	1    0    0    -1  
$EndComp
Wire Wire Line
	8400 2500 8650 2500
$Comp
L power:GND #PWR0108
U 1 1 634D4892
P 8650 2800
F 0 "#PWR0108" H 8650 2550 50  0001 C CNN
F 1 "GND" H 8655 2627 50  0000 C CNN
F 2 "" H 8650 2800 50  0001 C CNN
F 3 "" H 8650 2800 50  0001 C CNN
	1    8650 2800
	1    0    0    -1  
$EndComp
Wire Wire Line
	8400 2700 8650 2700
Wire Wire Line
	8650 2700 8650 2800
Wire Wire Line
	8650 2500 8650 2400
$Comp
L power:+5V #PWR0109
U 1 1 634D39B5
P 8650 2400
F 0 "#PWR0109" H 8650 2250 50  0001 C CNN
F 1 "+5V" H 8665 2573 50  0000 C CNN
F 2 "" H 8650 2400 50  0001 C CNN
F 3 "" H 8650 2400 50  0001 C CNN
	1    8650 2400
	1    0    0    -1  
$EndComp
Text GLabel 8650 2600 2    50   Input ~ 0
Flow_sensor
Wire Wire Line
	8650 2600 8400 2600
Text GLabel 4100 3200 0    50   Input ~ 0
Flow_sensor
Text GLabel 4100 3300 0    50   Input ~ 0
Button
Text GLabel 6350 2600 2    50   Input ~ 0
Button
$Comp
L power:GND #PWR0110
U 1 1 634D716E
P 6350 2800
F 0 "#PWR0110" H 6350 2550 50  0001 C CNN
F 1 "GND" H 6355 2627 50  0000 C CNN
F 2 "" H 6350 2800 50  0001 C CNN
F 3 "" H 6350 2800 50  0001 C CNN
	1    6350 2800
	1    0    0    -1  
$EndComp
Wire Wire Line
	6250 2700 6350 2700
Wire Wire Line
	6350 2700 6350 2800
Wire Wire Line
	6350 2600 6250 2600
$Comp
L power:GND #PWR0111
U 1 1 634DDCBC
P 9950 4800
F 0 "#PWR0111" H 9950 4550 50  0001 C CNN
F 1 "GND" H 9955 4627 50  0000 C CNN
F 2 "" H 9950 4800 50  0001 C CNN
F 3 "" H 9950 4800 50  0001 C CNN
	1    9950 4800
	1    0    0    -1  
$EndComp
Wire Wire Line
	9950 4700 9950 4800
Wire Wire Line
	9950 4300 9950 4400
Text GLabel 4100 3500 0    50   Input ~ 0
LED
Text GLabel 9950 4100 2    50   Input ~ 0
LED
Wire Wire Line
	9950 4300 9850 4300
Wire Wire Line
	9950 4100 9850 4100
$Comp
L power:GND #PWR0112
U 1 1 634E56B2
P 9150 4400
F 0 "#PWR0112" H 9150 4150 50  0001 C CNN
F 1 "GND" H 9155 4227 50  0000 C CNN
F 2 "" H 9150 4400 50  0001 C CNN
F 3 "" H 9150 4400 50  0001 C CNN
	1    9150 4400
	1    0    0    -1  
$EndComp
Wire Wire Line
	9250 4300 9150 4300
Wire Wire Line
	9150 4300 9150 4400
NoConn ~ 9250 4100
$Comp
L power:+12V #PWR0113
U 1 1 634EF153
P 9150 4000
F 0 "#PWR0113" H 9150 3850 50  0001 C CNN
F 1 "+12V" H 9165 4173 50  0000 C CNN
F 2 "" H 9150 4000 50  0001 C CNN
F 3 "" H 9150 4000 50  0001 C CNN
	1    9150 4000
	1    0    0    -1  
$EndComp
Wire Wire Line
	9150 4000 9150 4100
Wire Wire Line
	9150 4100 9050 4100
Wire Wire Line
	9250 4200 9050 4200
Wire Notes Line
	5850 3250 8300 3250
Wire Notes Line
	8300 3250 8300 5450
Wire Notes Line
	8300 5450 5850 5450
Wire Notes Line
	5850 5450 5850 3250
Text Notes 7600 3400 0    50   ~ 0
Solenoid control
Wire Notes Line
	8450 3250 8450 5450
Wire Notes Line
	8450 5450 10450 5450
Wire Notes Line
	10450 5450 10450 3250
Wire Notes Line
	10450 3250 8450 3250
Text Notes 9850 3400 0    50   ~ 0
Feedback LED
$Comp
L power:GND #PWR0114
U 1 1 6350AF2E
P 4650 4700
F 0 "#PWR0114" H 4650 4450 50  0001 C CNN
F 1 "GND" H 4655 4527 50  0000 C CNN
F 2 "" H 4650 4700 50  0001 C CNN
F 3 "" H 4650 4700 50  0001 C CNN
	1    4650 4700
	1    0    0    -1  
$EndComp
Wire Wire Line
	4600 4700 4650 4700
Wire Wire Line
	4700 4700 4650 4700
Connection ~ 4650 4700
Wire Wire Line
	4600 4600 4600 4700
Wire Wire Line
	4700 4600 4700 4700
NoConn ~ 5100 3600
NoConn ~ 5100 3700
NoConn ~ 5100 3800
NoConn ~ 5100 3900
NoConn ~ 5100 4000
NoConn ~ 5100 4100
NoConn ~ 5100 4200
NoConn ~ 5100 4300
NoConn ~ 5100 3400
NoConn ~ 5100 3100
NoConn ~ 5100 3000
NoConn ~ 4100 3000
NoConn ~ 4100 3100
NoConn ~ 4100 3400
NoConn ~ 4100 3800
NoConn ~ 4100 3900
NoConn ~ 4100 4000
NoConn ~ 4100 4100
NoConn ~ 4100 4200
NoConn ~ 4100 4300
NoConn ~ 4700 2600
Wire Notes Line
	5850 3100 6750 3100
Wire Notes Line
	6750 3100 6750 2050
Wire Notes Line
	6750 2050 5850 2050
Wire Notes Line
	5850 2050 5850 3100
Wire Notes Line
	6900 3100 7800 3100
Wire Notes Line
	7800 3100 7800 2050
Wire Notes Line
	7800 2050 6900 2050
Wire Notes Line
	6900 2050 6900 3100
Text Notes 6200 2200 0    50   ~ 0
Push button
Text Notes 7450 2200 0    50   ~ 0
Buzzer
Wire Notes Line
	7950 3100 9500 3100
Wire Notes Line
	9500 3100 9500 2050
Wire Notes Line
	9500 2050 7950 2050
Wire Notes Line
	7950 2050 7950 3100
Text Notes 8950 2200 0    50   ~ 0
Flow sensor
Wire Notes Line
	1400 3050 1400 4250
Wire Notes Line
	1400 4250 2900 4250
Wire Notes Line
	2900 4250 2900 3050
Wire Notes Line
	2900 3050 1400 3050
Text Notes 2600 3200 0    50   ~ 0
Input
$Comp
L power:PWR_FLAG #FLG0101
U 1 1 63559C6C
P 2150 3500
F 0 "#FLG0101" H 2150 3575 50  0001 C CNN
F 1 "PWR_FLAG" H 2150 3673 50  0000 C CNN
F 2 "" H 2150 3500 50  0001 C CNN
F 3 "~" H 2150 3500 50  0001 C CNN
	1    2150 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	2150 3500 2150 3600
Wire Wire Line
	2150 3600 2050 3600
Connection ~ 2150 3600
Wire Wire Line
	2150 3600 2450 3600
$Comp
L power:PWR_FLAG #FLG0102
U 1 1 6355F6D4
P 2150 3900
F 0 "#FLG0102" H 2150 3975 50  0001 C CNN
F 1 "PWR_FLAG" H 2150 4073 50  0000 C CNN
F 2 "" H 2150 3900 50  0001 C CNN
F 3 "~" H 2150 3900 50  0001 C CNN
	1    2150 3900
	-1   0    0    1   
$EndComp
Wire Wire Line
	2150 3800 2500 3800
Wire Wire Line
	2500 3800 2500 3900
Connection ~ 2150 3800
NoConn ~ 2050 3700
Wire Wire Line
	7400 2550 7300 2550
$EndSCHEMATC
