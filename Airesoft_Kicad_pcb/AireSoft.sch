EESchema Schematic File Version 2
LIBS:TP4056
LIBS:power
LIBS:device
LIBS:switches
LIBS:relays
LIBS:motors
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:nodemcu_v3_lolin
LIBS:_saved_AireSoft-cache
LIBS:AireSoft-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Conn_01x03_Male J5
U 1 1 5AD75E61
P 7950 4650
F 0 "J5" H 7900 4650 50  0000 C CNN
F 1 "SENSOR" H 8450 4950 50  0000 C CNN
F 2 "Connectors_Molex:Molex_KK-6410-03_03x2.54mm_Straight" H 7950 4650 50  0001 C CNN
F 3 "" H 7950 4650 50  0001 C CNN
	1    7950 4650
	-1   0    0    -1  
$EndComp
Text Label 3750 2300 2    60   ~ 0
3V
Text Label 3750 2400 2    60   ~ 0
GND
Text Label 3750 2500 2    60   ~ 0
SENSOR
$Comp
L Conn_01x02_Male J1
U 1 1 5AD75FE4
P 5600 2250
F 0 "J1" H 5750 2300 50  0000 C CNN
F 1 "PULSADOR" H 5450 2200 50  0000 C CNN
F 2 "Connectors_Molex:Molex_KK-6410-02_02x2.54mm_Straight" H 5600 2250 50  0001 C CNN
F 3 "" H 5600 2250 50  0001 C CNN
	1    5600 2250
	-1   0    0    1   
$EndComp
$Comp
L R R1
U 1 1 5AD7605E
P 5300 1850
F 0 "R1" V 5380 1850 50  0000 C CNN
F 1 "10K" V 5300 1850 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 5230 1850 50  0001 C CNN
F 3 "" H 5300 1850 50  0001 C CNN
	1    5300 1850
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR01
U 1 1 5AD761AD
P 5300 2350
F 0 "#PWR01" H 5300 2100 50  0001 C CNN
F 1 "GND" H 5300 2200 50  0000 C CNN
F 2 "" H 5300 2350 50  0001 C CNN
F 3 "" H 5300 2350 50  0001 C CNN
	1    5300 2350
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR02
U 1 1 5AD761C9
P 5300 1550
F 0 "#PWR02" H 5300 1400 50  0001 C CNN
F 1 "+3.3V" H 5300 1690 50  0000 C CNN
F 2 "" H 5300 1550 50  0001 C CNN
F 3 "" H 5300 1550 50  0001 C CNN
	1    5300 1550
	1    0    0    -1  
$EndComp
Text Label 4650 2150 0    60   ~ 0
PULSADOR
$Comp
L R R2
U 1 1 5AD764FE
P 5350 3750
F 0 "R2" V 5430 3750 50  0000 C CNN
F 1 "10K" V 5350 3750 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 5280 3750 50  0001 C CNN
F 3 "" H 5350 3750 50  0001 C CNN
	1    5350 3750
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR03
U 1 1 5AD76504
P 5350 4550
F 0 "#PWR03" H 5350 4300 50  0001 C CNN
F 1 "GND" H 5350 4400 50  0000 C CNN
F 2 "" H 5350 4550 50  0001 C CNN
F 3 "" H 5350 4550 50  0001 C CNN
	1    5350 4550
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR04
U 1 1 5AD7650A
P 5350 3450
F 0 "#PWR04" H 5350 3300 50  0001 C CNN
F 1 "+3.3V" H 5350 3590 50  0000 C CNN
F 2 "" H 5350 3450 50  0001 C CNN
F 3 "" H 5350 3450 50  0001 C CNN
	1    5350 3450
	1    0    0    -1  
$EndComp
Text Label 4700 4050 0    60   ~ 0
PULSADOR_AP
Text Label 3750 2600 2    60   ~ 0
PULSADOR
Text Label 3700 1900 2    60   ~ 0
PULSADOR_AP
Text Label 3700 1800 2    60   ~ 0
LED_AP
Text Label 3700 2000 2    60   ~ 0
LED_IR
NoConn ~ 3700 2100
NoConn ~ 3700 2200
NoConn ~ 3700 2700
NoConn ~ 3700 2800
NoConn ~ 3700 2900
NoConn ~ 3700 3000
NoConn ~ 1250 2000
NoConn ~ 1250 2100
NoConn ~ 1250 2200
NoConn ~ 1250 2300
NoConn ~ 1250 2400
NoConn ~ 1250 2500
NoConn ~ 1250 2600
NoConn ~ 1250 2900
NoConn ~ 1250 3000
NoConn ~ 1250 3200
Text Label 7050 4550 0    60   ~ 0
3V
Text Label 7050 4650 0    60   ~ 0
GND
Text Label 7250 4750 2    60   ~ 0
SENSOR
Text Label 7050 4750 0    60   ~ 0
SENSOR
Text Notes 1200 1250 0    118  Italic 24
CONEXIÓN NODEMCU V3 LOLIN
Text Notes 6700 4100 0    79   Italic 16
SENSOR DE TEMPERATURA
Text Notes 4550 1200 0    79   Italic 16
PULSADOR DE ESCOTILLA
Text Notes 4800 3150 0    79   Italic 16
PULSADOR DE AP
$Comp
L GND #PWR05
U 1 1 5AD77A83
P 8100 2050
F 0 "#PWR05" H 8100 1800 50  0001 C CNN
F 1 "GND" H 8100 1900 50  0000 C CNN
F 2 "" H 8100 2050 50  0001 C CNN
F 3 "" H 8100 2050 50  0001 C CNN
	1    8100 2050
	0    -1   -1   0   
$EndComp
$Comp
L R R3
U 1 1 5AD77AD3
P 7400 2050
F 0 "R3" V 7480 2050 50  0000 C CNN
F 1 "220" V 7400 2050 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 7330 2050 50  0001 C CNN
F 3 "" H 7400 2050 50  0001 C CNN
	1    7400 2050
	0    -1   -1   0   
$EndComp
Text Label 6800 2050 0    60   ~ 0
LED_AP
$Comp
L GND #PWR06
U 1 1 5AD78098
P 8100 3400
F 0 "#PWR06" H 8100 3150 50  0001 C CNN
F 1 "GND" H 8100 3250 50  0000 C CNN
F 2 "" H 8100 3400 50  0001 C CNN
F 3 "" H 8100 3400 50  0001 C CNN
	1    8100 3400
	0    -1   -1   0   
$EndComp
$Comp
L R R4
U 1 1 5AD7809E
P 7400 3400
F 0 "R4" V 7480 3400 50  0000 C CNN
F 1 "100" V 7400 3400 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 7330 3400 50  0001 C CNN
F 3 "" H 7400 3400 50  0001 C CNN
	1    7400 3400
	0    -1   -1   0   
$EndComp
Text Label 6800 3400 0    60   ~ 0
LED_IR
$Comp
L Conn_01x02_Male J3
U 1 1 5AD78750
P 7750 3200
F 0 "J3" V 7850 3250 50  0000 C CNN
F 1 "LED_IR" V 7650 3150 50  0000 C CNN
F 2 "Connectors_Molex:Molex_KK-6410-02_02x2.54mm_Straight" H 7750 3200 50  0001 C CNN
F 3 "" H 7750 3200 50  0001 C CNN
	1    7750 3200
	0    1    1    0   
$EndComp
$Comp
L Conn_01x02_Male J4
U 1 1 5AD78869
P 7850 1750
F 0 "J4" V 7950 1800 50  0000 C CNN
F 1 "LED_AP" V 7800 1700 50  0000 C CNN
F 2 "Connectors_Molex:Molex_KK-6410-02_02x2.54mm_Straight" H 7850 1750 50  0001 C CNN
F 3 "" H 7850 1750 50  0001 C CNN
	1    7850 1750
	0    1    1    0   
$EndComp
Text Notes 6800 1200 0    79   Italic 16
LED DEL ACCESS POINT
Text Notes 7000 2650 0    79   Italic 16
LED  INFRAROJO
Text Label 3700 3100 2    60   ~ 0
GND
Text Label 5300 1650 2    60   ~ 0
3V
Text Label 5350 3550 2    60   ~ 0
3V
Text Label 5300 2300 2    60   ~ 0
GND
Text Label 5350 4500 2    60   ~ 0
GND
Text Label 8050 3400 2    60   ~ 0
GND
Text Label 8050 2050 2    60   ~ 0
GND
Text Label 1250 3100 0    60   ~ 0
GND
Text Label 1250 1900 0    60   ~ 0
GND
Text Label 3700 3200 2    60   ~ 0
3V
Text Notes 1200 3850 0    79   Italic 16
BATERIA
$Comp
L Battery_Cell BT1
U 1 1 5AD79DF7
P 1300 4400
F 0 "BT1" H 1400 4500 50  0000 L CNN
F 1 "Battery_Cell" H 1400 4400 50  0000 L CNN
F 2 "Airesoft_pcb:BATT_1X18650" V 1300 4460 50  0001 C CNN
F 3 "" V 1300 4460 50  0001 C CNN
	1    1300 4400
	1    0    0    -1  
$EndComp
Text Notes 2550 3850 0    79   Italic 16
MODULO TP4056
Text Label 2300 4550 0    60   ~ 0
OUT-
Text Label 2550 4925 0    60   ~ 0
OUT+
Text Label 3900 4450 2    60   ~ 0
B+
Text Label 2300 4450 0    60   ~ 0
B-
NoConn ~ 2300 4150
NoConn ~ 3900 4150
Text Label 1250 2800 0    60   ~ 0
OUT+
Text Label 1850 4100 2    60   ~ 0
B+
Text Label 1850 4600 2    60   ~ 0
B-
Text Label 1250 2700 0    60   ~ 0
OUT-
$Comp
L NODEMCU_V3_LOLIN M1
U 1 1 5AD7B196
P 2500 2450
F 0 "M1" H 2500 2450 60  0000 C CNN
F 1 "NODEMCU_V3_LOLIN" H 2450 3300 60  0000 C CNN
F 2 "Airesoft_pcb:NODEMCU_V3_LOLIN" H 2500 2450 60  0001 C CNN
F 3 "" H 2500 2450 60  0001 C CNN
	1    2500 2450
	1    0    0    -1  
$EndComp
$Comp
L TP4056 Cg1
U 1 1 5AD7A7C5
P 3100 4350
F 0 "Cg1" H 3100 4700 60  0000 C CNN
F 1 "TP4056" H 3100 4375 60  0000 C CNN
F 2 "Airesoft_pcb:TP4056" H 3125 4600 60  0001 C CNN
F 3 "" H 3125 4600 60  0001 C CNN
	1    3100 4350
	1    0    0    -1  
$EndComp
$Comp
L SW_Push J2
U 1 1 5AE0C120
P 5450 4250
F 0 "J2" H 5500 4350 50  0000 L CNN
F 1 "PULSADOR_AP" V 5400 4575 50  0000 C CNN
F 2 "Buttons_Switches_THT:SW_Tactile_SPST_Angled_PTS645Vx83-2LFS" H 5450 4450 50  0001 C CNN
F 3 "" H 5450 4450 50  0001 C CNN
	1    5450 4250
	0    -1   -1   0   
$EndComp
$Comp
L SW_DPDT_x2 SW1
U 1 1 5AE0CFBB
P 3125 4925
F 0 "SW1" H 3125 5095 50  0000 C CNN
F 1 "SW_DPDT_x2" H 3125 4725 50  0000 C CNN
F 2 "Airesoft_pcb:Switch" H 3125 4925 50  0001 C CNN
F 3 "" H 3125 4925 50  0001 C CNN
	1    3125 4925
	1    0    0    -1  
$EndComp
Text Label 3900 4550 2    60   ~ 0
OUT1+
Text Label 3750 5025 2    60   ~ 0
OUT1+
NoConn ~ 3750 4825
$Comp
L Audio-Jack-3 J6
U 1 1 5AFE35B5
P 2675 6775
F 0 "J6" H 2625 6950 50  0000 C CNN
F 1 "Audio-Jack-3" H 2775 6705 50  0000 C CNN
F 2 ".pretty:JACK 3,5MM" H 2925 6875 50  0001 C CNN
F 3 "" H 2925 6875 50  0001 C CNN
	1    2675 6775
	1    0    0    -1  
$EndComp
Text Label 3600 5850 2    60   ~ 0
3V
$Comp
L GND #PWR07
U 1 1 5AFE414D
P 3600 7000
F 0 "#PWR07" H 3600 6750 50  0001 C CNN
F 1 "GND" H 3600 6850 50  0000 C CNN
F 2 "" H 3600 7000 50  0001 C CNN
F 3 "" H 3600 7000 50  0001 C CNN
	1    3600 7000
	1    0    0    -1  
$EndComp
Wire Wire Line
	3750 2300 3050 2300
Wire Wire Line
	3750 2400 3050 2400
Wire Wire Line
	3750 2500 3050 2500
Wire Wire Line
	5300 1700 5300 1550
Wire Wire Line
	5300 2000 5300 2150
Wire Wire Line
	5400 2250 5300 2250
Wire Wire Line
	5300 2250 5300 2350
Wire Wire Line
	4650 2150 5400 2150
Connection ~ 5300 2150
Wire Wire Line
	5350 3600 5350 3450
Wire Wire Line
	5350 3900 5350 4050
Wire Wire Line
	5450 4450 5350 4450
Wire Wire Line
	5350 4450 5350 4550
Wire Wire Line
	4700 4050 5450 4050
Connection ~ 5350 4050
Wire Wire Line
	3050 2600 3750 2600
Wire Wire Line
	3700 1900 3050 1900
Wire Wire Line
	3050 1800 3700 1800
Wire Wire Line
	3050 2000 3700 2000
Wire Wire Line
	3050 2100 3700 2100
Wire Wire Line
	3050 2200 3700 2200
Wire Wire Line
	3050 2700 3700 2700
Wire Wire Line
	3050 2800 3700 2800
Wire Wire Line
	3050 2900 3700 2900
Wire Wire Line
	3050 3000 3700 3000
Wire Wire Line
	3050 3100 3700 3100
Wire Wire Line
	3050 3200 3700 3200
Wire Wire Line
	1900 1800 1250 1800
Wire Wire Line
	1900 2000 1250 2000
Wire Wire Line
	1900 2100 1250 2100
Wire Wire Line
	1900 2200 1250 2200
Wire Wire Line
	1900 2300 1250 2300
Wire Wire Line
	1900 2400 1250 2400
Wire Wire Line
	1900 2500 1250 2500
Wire Wire Line
	1900 2600 1250 2600
Wire Wire Line
	1900 2700 1250 2700
Wire Wire Line
	1900 2800 1250 2800
Wire Wire Line
	1900 2900 1250 2900
Wire Wire Line
	1900 3000 1250 3000
Wire Wire Line
	1900 3100 1250 3100
Wire Wire Line
	1900 3200 1250 3200
Wire Wire Line
	7050 4550 7750 4550
Wire Wire Line
	7050 4650 7750 4650
Wire Wire Line
	7050 4750 7750 4750
Wire Bus Line
	4100 1050 900  1050
Wire Bus Line
	900  1300 4100 1300
Wire Bus Line
	6650 3950 6650 4950
Wire Bus Line
	6650 4950 8350 4950
Wire Bus Line
	6650 4150 8350 4150
Wire Bus Line
	6650 3950 8350 3950
Wire Bus Line
	8350 3950 8350 4950
Wire Bus Line
	4350 2800 6250 2800
Wire Bus Line
	6250 2800 6250 1050
Wire Bus Line
	6250 1050 4350 1050
Wire Bus Line
	4350 1050 4350 2800
Wire Bus Line
	6250 1250 4350 1250
Wire Bus Line
	6250 4750 6250 3000
Wire Bus Line
	6250 3000 4350 3000
Wire Bus Line
	4350 3000 4350 4750
Wire Bus Line
	6250 3200 4350 3200
Wire Bus Line
	900  3500 4100 3500
Wire Bus Line
	900  1050 900  3500
Wire Bus Line
	4100 3500 4100 1050
Wire Wire Line
	7850 2050 8100 2050
Wire Wire Line
	7550 2050 7750 2050
Wire Wire Line
	6800 2050 7250 2050
Wire Wire Line
	7750 3400 8100 3400
Wire Wire Line
	7550 3400 7650 3400
Wire Wire Line
	6800 3400 7250 3400
Wire Wire Line
	7750 2050 7750 1950
Wire Wire Line
	7850 1950 7850 2050
Wire Bus Line
	6650 2300 8450 2300
Wire Bus Line
	8450 2300 8450 1050
Wire Bus Line
	8450 1050 6600 1050
Wire Bus Line
	6600 1050 6600 2300
Wire Bus Line
	6600 2300 6700 2300
Wire Bus Line
	6600 1300 8450 1300
Wire Bus Line
	6650 3750 8450 3750
Wire Bus Line
	8450 3750 8450 2500
Wire Bus Line
	8450 2500 6600 2500
Wire Bus Line
	6600 2500 6600 3750
Wire Bus Line
	6600 3750 6700 3750
Wire Bus Line
	6600 2750 8450 2750
Wire Wire Line
	1900 1900 1250 1900
Wire Wire Line
	1300 4100 1850 4100
Wire Wire Line
	1300 4600 1850 4600
Wire Bus Line
	900  3700 900  4750
Wire Bus Line
	1950 3700 1950 4750
Wire Bus Line
	1950 3700 900  3700
Wire Bus Line
	900  3900 1950 3900
Wire Wire Line
	1300 4100 1300 4200
Wire Wire Line
	1300 4500 1300 4600
Wire Bus Line
	1950 4750 900  4750
Wire Bus Line
	2250 3700 2250 4825
Wire Bus Line
	2250 3700 4100 3700
Wire Bus Line
	2250 3900 4100 3900
Wire Wire Line
	2300 4150 2575 4150
Wire Wire Line
	2300 4450 2575 4450
Wire Wire Line
	2575 4550 2300 4550
Wire Bus Line
	4100 3700 4100 5325
Wire Wire Line
	3625 4150 3900 4150
Wire Wire Line
	3625 4450 3900 4450
Wire Wire Line
	3900 4550 3625 4550
Wire Bus Line
	4350 4750 6225 4750
Wire Wire Line
	3325 4825 3750 4825
Wire Wire Line
	3325 5025 3750 5025
Wire Wire Line
	2550 4925 2925 4925
Wire Bus Line
	4100 5325 2250 5325
Wire Bus Line
	2250 5325 2250 4775
Wire Wire Line
	3000 6675 2875 6675
Text Label 1250 1800 0    60   ~ 0
A0
Wire Bus Line
	2275 5550 2275 7275
Wire Bus Line
	2275 7275 4300 7275
Wire Bus Line
	2275 5750 4300 5750
Wire Bus Line
	4300 7275 4300 5550
Wire Bus Line
	4300 5550 2275 5550
Text Notes 2675 5675 0    60   ~ 0
SENSOR DE CORRIENTE
Wire Wire Line
	2475 6875 2475 7175
NoConn ~ 2475 7175
$Comp
L LM358 U1
U 1 1 5B01B945
P 3700 6450
F 0 "U1" H 3700 6650 50  0000 L CNN
F 1 "LM358" H 3700 6250 50  0000 L CNN
F 2 "Housings_DIP:DIP-8_W7.62mm_LongPads" H 3700 6450 50  0001 C CNN
F 3 "" H 3700 6450 50  0001 C CNN
	1    3700 6450
	1    0    0    -1  
$EndComp
Wire Wire Line
	3600 6750 3600 7000
Wire Wire Line
	3600 6150 3600 5850
Wire Wire Line
	4000 6450 4200 6450
Wire Wire Line
	3000 6350 3400 6350
Connection ~ 4050 6450
Wire Wire Line
	3400 6550 3300 6550
Wire Wire Line
	3300 6550 3300 7200
Wire Wire Line
	3300 7200 4050 7200
Wire Wire Line
	4050 7200 4050 6450
Text Label 4200 6450 2    60   ~ 0
A0
Wire Wire Line
	3000 6675 3000 6350
$Comp
L GND #PWR08
U 1 1 5B01C196
P 3000 6875
F 0 "#PWR08" H 3000 6625 50  0001 C CNN
F 1 "GND" H 3000 6725 50  0000 C CNN
F 2 "" H 3000 6875 50  0001 C CNN
F 3 "" H 3000 6875 50  0001 C CNN
	1    3000 6875
	1    0    0    -1  
$EndComp
Wire Wire Line
	3000 6875 3000 6775
Wire Wire Line
	3000 6775 2875 6775
$EndSCHEMATC
