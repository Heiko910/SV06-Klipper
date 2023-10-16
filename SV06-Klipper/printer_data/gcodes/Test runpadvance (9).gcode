; ### Klipper Pressure Advance Calibration Pattern ###
; -------------------------------------------
;
; Printer: sv06
; Filament: sovol blue
; Created: Thu Oct 05 2023 23:23:05 GMT-0700 (Pacific Daylight Time)
;
; Settings Printer:
; Filament Diameter = 1.75 mm
; Nozzle Diameter = 0.4 mm
; Start G-code = ; M104 S[first_layer_temperature] ; set extruder temp
; M140 S[first_layer_bed_temperature] ; set bed temp
; M190 S[first_layer_bed_temperature] ; wait for bed temp
; M109 S[first_layer_temperature] ; wait for extruder temp
; G28;
; G1 Z4.0 F3000 ;Move Z Axis up
; G92 E0 ;Reset Extruder
; G1 X5.1 Y20 Z0.28 F5000.0 ;Move to start position
; G1 X5.1 Y30.0 Z0.28 F1500.0 E1 ;Draw a short bit in case the extruder turns in the wrong direction
; G1 X5.1 Y200.0 Z0.28 F1500.0 E15 ;Draw the first line
; G1 X5.4 Y200.0 Z0.28 F5000.0 ;Move to side a little
; G1 X5.4 Y20 Z0.28 F1500.0 E30 ;Draw the second line
; G92 E0 ;Reset Extruder
; G1 Z2.0 F3000 ;Move Z Axis up
; End G-code = ; G91 ;Relative positioning
; G1 X5 Y5 F3000 ;Wipe out
; G1 Z10 ;Raise Z more
; G90 ;Absolute positioning
; G1 X10 Y220 ;Present print
; M106 S0 ;Turn-off fan
; M104 S0 ;Turn-off hotend
; M140 S0 ;Turn-off bed
; M84 X Y E ;Disable all steppers but Z
; Retraction Distance = 0.5 mm
; Layer Height = 0.2 mm
; Fan Speed = 0 %
; Z-axis Offset = 0 mm
;
; Settings Print Bed:
; Bed Size X = 230 mm
; Bed Size Y = 230 mm
;
; Settings Speed:
; Slow Printing Speed = 300 mm/min
; Fast Printing Speed = 9000 mm/min
; Movement Speed = 30000 mm/min
; Retract Speed = 2400 mm/min
; Unretract Speed = 2400 mm/min
; Printing Acceleration = 2000 mm/s^2
;
; Settings Pattern:
; Starting Value Factor = 0
; Ending Value Factor = 0.1
; Factor Stepping = 0.005
; Test Line Spacing = 5 mm
; Test Line Length Slow = 20 mm
; Test Line Length Fast = 40 mm
; Print Pattern = Standard
; Print Frame = true
; Number Lines = true
; Print Size X = 98 mm
; Print Size Y = 125 mm
; Print Rotation = 0 degree
;
; Settings Advance:
; Nozzle / Line Ratio = 1.2
; Use FWRETRACT = false
; Extrusion Multiplier = 1
; Prime Nozzle = true
; Prime Extrusion Multiplier = 2.5
; Prime Speed = 1800
; Dwell Time = 0 s
;
; prepare printing
;
M104 S[first_layer_temperature] ; set extruder temp
M140 S[first_layer_bed_temperature] ; set bed temp
M190 S[first_layer_bed_temperature] ; wait for bed temp
M109 S[first_layer_temperature] ; wait for extruder temp
G28;
G1 Z4.0 F3000 ;Move Z Axis up
G92 E0 ;Reset Extruder
G1 X5.1 Y20 Z0.28 F5000.0 ;Move to start position
G1 X5.1 Y30.0 Z0.28 F1500.0 E1 ;Draw a short bit in case the extruder turns in the wrong direction
G1 X5.1 Y200.0 Z0.28 F1500.0 E15 ;Draw the first line
G1 X5.4 Y200.0 Z0.28 F5000.0 ;Move to side a little
G1 X5.4 Y20 Z0.28 F1500.0 E30 ;Draw the second line
G92 E0 ;Reset Extruder
G1 Z2.0 F3000 ;Move Z Axis up
G21 ; Millimeter units
G90 ; Absolute XYZ
M83 ; Relative E
SET_VELOCITY_LIMIT ACCEL=2000 ACCEL_TO_DECEL=1000 ; Acceleration
G92 E0 ; Reset extruder distance
M106 S0
G1 X115 Y115 F30000 ; move to start
G1 Z0.2 F300 ; Move to layer height
;
; prime nozzle
;
G1 X66 Y52.5 F30000 ; move to start
G1 X66 Y177.5 E12.47255 F1800 ; print line
G1 X66.72 Y177.5 F30000 ; move to start
G1 X66.72 Y52.5 E12.47255 F1800 ; print line
G1 E-0.5 F2400 ; retract
;
; print anchor frame
G1 E0.5 F2400 ; un-retract
G1 X76 Y49.5 F30000 ; move to start
G1 X76 Y155.5 E4.65376 F300 ; print line
G1 X76.48 Y155.5 F30000 ; move to start
G1 X76.48 Y49.5 E4.65376 F300 ; print line
G1 E-0.5 F2400 ; retract
G1 X156 Y49.5 F30000 ; move to start
G1 E0.5 F2400 ; un-retract
G1 X156 Y155.5 E4.65376 F300 ; print line
G1 X155.52 Y155.5 F30000 ; move to start
G1 X155.52 Y49.5 E4.65376 F300 ; print line
G1 E-0.5 F2400 ; retract
;
; start the Test pattern
;
G1 X76 Y52.5 F30000 ; move to start
SET_PRESSURE_ADVANCE ADVANCE=0 ; set Pressure Advance
M117 K0 ; 
G1 E0.5 F2400 ; un-retract
G1 X96 Y52.5 E0.79824 F300 ; print line
G1 X136 Y52.5 E1.59649 F9000 ; print line
G1 X156 Y52.5 E0.79824 F300 ; print line
G1 E-0.5 F2400 ; retract
G1 X76 Y57.5 F30000 ; move to start
SET_PRESSURE_ADVANCE ADVANCE=0.005 ; set Pressure Advance
M117 K0.005 ; 
G1 E0.5 F2400 ; un-retract
G1 X96 Y57.5 E0.79824 F300 ; print line
G1 X136 Y57.5 E1.59649 F9000 ; print line
G1 X156 Y57.5 E0.79824 F300 ; print line
G1 E-0.5 F2400 ; retract
G1 X76 Y62.5 F30000 ; move to start
SET_PRESSURE_ADVANCE ADVANCE=0.01 ; set Pressure Advance
M117 K0.01 ; 
G1 E0.5 F2400 ; un-retract
G1 X96 Y62.5 E0.79824 F300 ; print line
G1 X136 Y62.5 E1.59649 F9000 ; print line
G1 X156 Y62.5 E0.79824 F300 ; print line
G1 E-0.5 F2400 ; retract
G1 X76 Y67.5 F30000 ; move to start
SET_PRESSURE_ADVANCE ADVANCE=0.015 ; set Pressure Advance
M117 K0.015 ; 
G1 E0.5 F2400 ; un-retract
G1 X96 Y67.5 E0.79824 F300 ; print line
G1 X136 Y67.5 E1.59649 F9000 ; print line
G1 X156 Y67.5 E0.79824 F300 ; print line
G1 E-0.5 F2400 ; retract
G1 X76 Y72.5 F30000 ; move to start
SET_PRESSURE_ADVANCE ADVANCE=0.02 ; set Pressure Advance
M117 K0.02 ; 
G1 E0.5 F2400 ; un-retract
G1 X96 Y72.5 E0.79824 F300 ; print line
G1 X136 Y72.5 E1.59649 F9000 ; print line
G1 X156 Y72.5 E0.79824 F300 ; print line
G1 E-0.5 F2400 ; retract
G1 X76 Y77.5 F30000 ; move to start
SET_PRESSURE_ADVANCE ADVANCE=0.025 ; set Pressure Advance
M117 K0.025 ; 
G1 E0.5 F2400 ; un-retract
G1 X96 Y77.5 E0.79824 F300 ; print line
G1 X136 Y77.5 E1.59649 F9000 ; print line
G1 X156 Y77.5 E0.79824 F300 ; print line
G1 E-0.5 F2400 ; retract
G1 X76 Y82.5 F30000 ; move to start
SET_PRESSURE_ADVANCE ADVANCE=0.03 ; set Pressure Advance
M117 K0.03 ; 
G1 E0.5 F2400 ; un-retract
G1 X96 Y82.5 E0.79824 F300 ; print line
G1 X136 Y82.5 E1.59649 F9000 ; print line
G1 X156 Y82.5 E0.79824 F300 ; print line
G1 E-0.5 F2400 ; retract
G1 X76 Y87.5 F30000 ; move to start
SET_PRESSURE_ADVANCE ADVANCE=0.035 ; set Pressure Advance
M117 K0.035 ; 
G1 E0.5 F2400 ; un-retract
G1 X96 Y87.5 E0.79824 F300 ; print line
G1 X136 Y87.5 E1.59649 F9000 ; print line
G1 X156 Y87.5 E0.79824 F300 ; print line
G1 E-0.5 F2400 ; retract
G1 X76 Y92.5 F30000 ; move to start
SET_PRESSURE_ADVANCE ADVANCE=0.04 ; set Pressure Advance
M117 K0.04 ; 
G1 E0.5 F2400 ; un-retract
G1 X96 Y92.5 E0.79824 F300 ; print line
G1 X136 Y92.5 E1.59649 F9000 ; print line
G1 X156 Y92.5 E0.79824 F300 ; print line
G1 E-0.5 F2400 ; retract
G1 X76 Y97.5 F30000 ; move to start
SET_PRESSURE_ADVANCE ADVANCE=0.045 ; set Pressure Advance
M117 K0.045 ; 
G1 E0.5 F2400 ; un-retract
G1 X96 Y97.5 E0.79824 F300 ; print line
G1 X136 Y97.5 E1.59649 F9000 ; print line
G1 X156 Y97.5 E0.79824 F300 ; print line
G1 E-0.5 F2400 ; retract
G1 X76 Y102.5 F30000 ; move to start
SET_PRESSURE_ADVANCE ADVANCE=0.05 ; set Pressure Advance
M117 K0.05 ; 
G1 E0.5 F2400 ; un-retract
G1 X96 Y102.5 E0.79824 F300 ; print line
G1 X136 Y102.5 E1.59649 F9000 ; print line
G1 X156 Y102.5 E0.79824 F300 ; print line
G1 E-0.5 F2400 ; retract
G1 X76 Y107.5 F30000 ; move to start
SET_PRESSURE_ADVANCE ADVANCE=0.055 ; set Pressure Advance
M117 K0.055 ; 
G1 E0.5 F2400 ; un-retract
G1 X96 Y107.5 E0.79824 F300 ; print line
G1 X136 Y107.5 E1.59649 F9000 ; print line
G1 X156 Y107.5 E0.79824 F300 ; print line
G1 E-0.5 F2400 ; retract
G1 X76 Y112.5 F30000 ; move to start
SET_PRESSURE_ADVANCE ADVANCE=0.06 ; set Pressure Advance
M117 K0.06 ; 
G1 E0.5 F2400 ; un-retract
G1 X96 Y112.5 E0.79824 F300 ; print line
G1 X136 Y112.5 E1.59649 F9000 ; print line
G1 X156 Y112.5 E0.79824 F300 ; print line
G1 E-0.5 F2400 ; retract
G1 X76 Y117.5 F30000 ; move to start
SET_PRESSURE_ADVANCE ADVANCE=0.065 ; set Pressure Advance
M117 K0.065 ; 
G1 E0.5 F2400 ; un-retract
G1 X96 Y117.5 E0.79824 F300 ; print line
G1 X136 Y117.5 E1.59649 F9000 ; print line
G1 X156 Y117.5 E0.79824 F300 ; print line
G1 E-0.5 F2400 ; retract
G1 X76 Y122.5 F30000 ; move to start
SET_PRESSURE_ADVANCE ADVANCE=0.07 ; set Pressure Advance
M117 K0.07 ; 
G1 E0.5 F2400 ; un-retract
G1 X96 Y122.5 E0.79824 F300 ; print line
G1 X136 Y122.5 E1.59649 F9000 ; print line
G1 X156 Y122.5 E0.79824 F300 ; print line
G1 E-0.5 F2400 ; retract
G1 X76 Y127.5 F30000 ; move to start
SET_PRESSURE_ADVANCE ADVANCE=0.075 ; set Pressure Advance
M117 K0.075 ; 
G1 E0.5 F2400 ; un-retract
G1 X96 Y127.5 E0.79824 F300 ; print line
G1 X136 Y127.5 E1.59649 F9000 ; print line
G1 X156 Y127.5 E0.79824 F300 ; print line
G1 E-0.5 F2400 ; retract
G1 X76 Y132.5 F30000 ; move to start
SET_PRESSURE_ADVANCE ADVANCE=0.08 ; set Pressure Advance
M117 K0.08 ; 
G1 E0.5 F2400 ; un-retract
G1 X96 Y132.5 E0.79824 F300 ; print line
G1 X136 Y132.5 E1.59649 F9000 ; print line
G1 X156 Y132.5 E0.79824 F300 ; print line
G1 E-0.5 F2400 ; retract
G1 X76 Y137.5 F30000 ; move to start
SET_PRESSURE_ADVANCE ADVANCE=0.085 ; set Pressure Advance
M117 K0.085 ; 
G1 E0.5 F2400 ; un-retract
G1 X96 Y137.5 E0.79824 F300 ; print line
G1 X136 Y137.5 E1.59649 F9000 ; print line
G1 X156 Y137.5 E0.79824 F300 ; print line
G1 E-0.5 F2400 ; retract
G1 X76 Y142.5 F30000 ; move to start
SET_PRESSURE_ADVANCE ADVANCE=0.09 ; set Pressure Advance
M117 K0.09 ; 
G1 E0.5 F2400 ; un-retract
G1 X96 Y142.5 E0.79824 F300 ; print line
G1 X136 Y142.5 E1.59649 F9000 ; print line
G1 X156 Y142.5 E0.79824 F300 ; print line
G1 E-0.5 F2400 ; retract
G1 X76 Y147.5 F30000 ; move to start
SET_PRESSURE_ADVANCE ADVANCE=0.095 ; set Pressure Advance
M117 K0.095 ; 
G1 E0.5 F2400 ; un-retract
G1 X96 Y147.5 E0.79824 F300 ; print line
G1 X136 Y147.5 E1.59649 F9000 ; print line
G1 X156 Y147.5 E0.79824 F300 ; print line
G1 E-0.5 F2400 ; retract
G1 X76 Y152.5 F30000 ; move to start
;
; Mark the test area for reference
M117 K0
SET_PRESSURE_ADVANCE ADVANCE=0 ; Set Pressure Advance 0
G1 X96 Y157.5 F30000 ; move to start
G1 E0.5 F2400 ; un-retract
G1 X96 Y177.5 E0.79824 F300 ; print line
G1 E-0.5 F2400 ; retract
G1 X136 Y157.5 F30000 ; move to start
G1 E0.5 F2400 ; un-retract
G1 X136 Y177.5 E0.79824 F300 ; print line
G1 E-0.5 F2400 ; retract
G1 Z0.3 F300 ; zHop
;
; print K-values
;
G1 X158 Y50.5 F30000 ; move to start
G1 Z0.2 F300 ; zHop
G1 E0.5 F2400 ; un-retract
G1 X160 Y50.5 E0.07982 F300 ; 0
G1 X160 Y52.5 E0.07982 F300 ; 0
G1 X160 Y54.5 E0.07982 F300 ; 0
G1 X158 Y54.5 E0.07982 F300 ; 0
G1 X158 Y52.5 E0.07982 F300 ; 0
G1 X158 Y50.5 E0.07982 F300 ; 0
G1 E-0.5 F2400 ; retract
G1 Z0.3 F300 ; zHop
G1 X158 Y60.5 F30000 ; move to start
G1 Z0.2 F300 ; zHop
G1 E0.5 F2400 ; un-retract
G1 X160 Y60.5 E0.07982 F300 ; 0
G1 X160 Y62.5 E0.07982 F300 ; 0
G1 X160 Y64.5 E0.07982 F300 ; 0
G1 X158 Y64.5 E0.07982 F300 ; 0
G1 X158 Y62.5 E0.07982 F300 ; 0
G1 X158 Y60.5 E0.07982 F300 ; 0
G1 E-0.5 F2400 ; retract
G1 X161 Y60.5 F30000 ; move to start
G1 E0.5 F2400 ; un-retract
G1 X161 Y60.9 E0.01596 F300 ; dot
G1 E-0.5 F2400 ; retract
G1 X162 Y60.5 F30000 ; move to start
G1 E0.5 F2400 ; un-retract
G1 X164 Y60.5 E0.07982 F300 ; 0
G1 X164 Y62.5 E0.07982 F300 ; 0
G1 X164 Y64.5 E0.07982 F300 ; 0
G1 X162 Y64.5 E0.07982 F300 ; 0
G1 X162 Y62.5 E0.07982 F300 ; 0
G1 X162 Y60.5 E0.07982 F300 ; 0
G1 E-0.5 F2400 ; retract
G1 X165 Y60.5 F30000 ; move to start
G1 E0.5 F2400 ; un-retract
G1 X165 Y62.5 E0.07982 F300 ; 1
G1 X165 Y64.5 E0.07982 F300 ; 1
G1 E-0.5 F2400 ; retract
G1 Z0.3 F300 ; zHop
G1 X158 Y70.5 F30000 ; move to start
G1 Z0.2 F300 ; zHop
G1 E0.5 F2400 ; un-retract
G1 X160 Y70.5 E0.07982 F300 ; 0
G1 X160 Y72.5 E0.07982 F300 ; 0
G1 X160 Y74.5 E0.07982 F300 ; 0
G1 X158 Y74.5 E0.07982 F300 ; 0
G1 X158 Y72.5 E0.07982 F300 ; 0
G1 X158 Y70.5 E0.07982 F300 ; 0
G1 E-0.5 F2400 ; retract
G1 X161 Y70.5 F30000 ; move to start
G1 E0.5 F2400 ; un-retract
G1 X161 Y70.9 E0.01596 F300 ; dot
G1 E-0.5 F2400 ; retract
G1 X162 Y70.5 F30000 ; move to start
G1 E0.5 F2400 ; un-retract
G1 X164 Y70.5 E0.07982 F300 ; 0
G1 X164 Y72.5 E0.07982 F300 ; 0
G1 X164 Y74.5 E0.07982 F300 ; 0
G1 X162 Y74.5 E0.07982 F300 ; 0
G1 X162 Y72.5 E0.07982 F300 ; 0
G1 X162 Y70.5 E0.07982 F300 ; 0
G1 E-0.5 F2400 ; retract
G1 X165 Y70.5 F30000 ; move to start
G1 E0.5 F2400 ; un-retract
G1 X165 Y72.5 F30000 ; move to start
G1 X165 Y74.5 F30000 ; move to start
G1 X167 Y74.5 E0.07982 F300 ; 2
G1 X167 Y72.5 E0.07982 F300 ; 2
G1 X165 Y72.5 E0.07982 F300 ; 2
G1 X165 Y70.5 E0.07982 F300 ; 2
G1 X167 Y70.5 E0.07982 F300 ; 2
G1 E-0.5 F2400 ; retract
G1 Z0.3 F300 ; zHop
G1 X158 Y80.5 F30000 ; move to start
G1 Z0.2 F300 ; zHop
G1 E0.5 F2400 ; un-retract
G1 X160 Y80.5 E0.07982 F300 ; 0
G1 X160 Y82.5 E0.07982 F300 ; 0
G1 X160 Y84.5 E0.07982 F300 ; 0
G1 X158 Y84.5 E0.07982 F300 ; 0
G1 X158 Y82.5 E0.07982 F300 ; 0
G1 X158 Y80.5 E0.07982 F300 ; 0
G1 E-0.5 F2400 ; retract
G1 X161 Y80.5 F30000 ; move to start
G1 E0.5 F2400 ; un-retract
G1 X161 Y80.9 E0.01596 F300 ; dot
G1 E-0.5 F2400 ; retract
G1 X162 Y80.5 F30000 ; move to start
G1 E0.5 F2400 ; un-retract
G1 X164 Y80.5 E0.07982 F300 ; 0
G1 X164 Y82.5 E0.07982 F300 ; 0
G1 X164 Y84.5 E0.07982 F300 ; 0
G1 X162 Y84.5 E0.07982 F300 ; 0
G1 X162 Y82.5 E0.07982 F300 ; 0
G1 X162 Y80.5 E0.07982 F300 ; 0
G1 E-0.5 F2400 ; retract
G1 X165 Y80.5 F30000 ; move to start
G1 E0.5 F2400 ; un-retract
G1 X165 Y82.5 F30000 ; move to start
G1 X165 Y84.5 F30000 ; move to start
G1 X167 Y84.5 E0.07982 F300 ; 3
G1 X167 Y82.5 E0.07982 F300 ; 3
G1 X167 Y80.5 E0.07982 F300 ; 3
G1 X165 Y80.5 E0.07982 F300 ; 3
G1 X165 Y82.5 F30000 ; move to start
G1 X167 Y82.5 E0.07982 F300 ; 3
G1 E-0.5 F2400 ; retract
G1 Z0.3 F300 ; zHop
G1 X158 Y90.5 F30000 ; move to start
G1 Z0.2 F300 ; zHop
G1 E0.5 F2400 ; un-retract
G1 X160 Y90.5 E0.07982 F300 ; 0
G1 X160 Y92.5 E0.07982 F300 ; 0
G1 X160 Y94.5 E0.07982 F300 ; 0
G1 X158 Y94.5 E0.07982 F300 ; 0
G1 X158 Y92.5 E0.07982 F300 ; 0
G1 X158 Y90.5 E0.07982 F300 ; 0
G1 E-0.5 F2400 ; retract
G1 X161 Y90.5 F30000 ; move to start
G1 E0.5 F2400 ; un-retract
G1 X161 Y90.9 E0.01596 F300 ; dot
G1 E-0.5 F2400 ; retract
G1 X162 Y90.5 F30000 ; move to start
G1 E0.5 F2400 ; un-retract
G1 X164 Y90.5 E0.07982 F300 ; 0
G1 X164 Y92.5 E0.07982 F300 ; 0
G1 X164 Y94.5 E0.07982 F300 ; 0
G1 X162 Y94.5 E0.07982 F300 ; 0
G1 X162 Y92.5 E0.07982 F300 ; 0
G1 X162 Y90.5 E0.07982 F300 ; 0
G1 E-0.5 F2400 ; retract
G1 X165 Y90.5 F30000 ; move to start
G1 E0.5 F2400 ; un-retract
G1 X165 Y92.5 F30000 ; move to start
G1 X165 Y94.5 F30000 ; move to start
G1 X165 Y92.5 E0.07982 F300 ; 4
G1 X167 Y92.5 E0.07982 F300 ; 4
G1 X167 Y94.5 F30000 ; move to start
G1 X167 Y92.5 E0.07982 F300 ; 4
G1 X167 Y90.5 E0.07982 F300 ; 4
G1 E-0.5 F2400 ; retract
G1 Z0.3 F300 ; zHop
G1 X158 Y100.5 F30000 ; move to start
G1 Z0.2 F300 ; zHop
G1 E0.5 F2400 ; un-retract
G1 X160 Y100.5 E0.07982 F300 ; 0
G1 X160 Y102.5 E0.07982 F300 ; 0
G1 X160 Y104.5 E0.07982 F300 ; 0
G1 X158 Y104.5 E0.07982 F300 ; 0
G1 X158 Y102.5 E0.07982 F300 ; 0
G1 X158 Y100.5 E0.07982 F300 ; 0
G1 E-0.5 F2400 ; retract
G1 X161 Y100.5 F30000 ; move to start
G1 E0.5 F2400 ; un-retract
G1 X161 Y100.9 E0.01596 F300 ; dot
G1 E-0.5 F2400 ; retract
G1 X162 Y100.5 F30000 ; move to start
G1 E0.5 F2400 ; un-retract
G1 X164 Y100.5 E0.07982 F300 ; 0
G1 X164 Y102.5 E0.07982 F300 ; 0
G1 X164 Y104.5 E0.07982 F300 ; 0
G1 X162 Y104.5 E0.07982 F300 ; 0
G1 X162 Y102.5 E0.07982 F300 ; 0
G1 X162 Y100.5 E0.07982 F300 ; 0
G1 E-0.5 F2400 ; retract
G1 X165 Y100.5 F30000 ; move to start
G1 E0.5 F2400 ; un-retract
G1 X167 Y100.5 E0.07982 F300 ; 5
G1 X167 Y102.5 E0.07982 F300 ; 5
G1 X165 Y102.5 E0.07982 F300 ; 5
G1 X165 Y104.5 E0.07982 F300 ; 5
G1 X167 Y104.5 E0.07982 F300 ; 5
G1 E-0.5 F2400 ; retract
G1 Z0.3 F300 ; zHop
G1 X158 Y110.5 F30000 ; move to start
G1 Z0.2 F300 ; zHop
G1 E0.5 F2400 ; un-retract
G1 X160 Y110.5 E0.07982 F300 ; 0
G1 X160 Y112.5 E0.07982 F300 ; 0
G1 X160 Y114.5 E0.07982 F300 ; 0
G1 X158 Y114.5 E0.07982 F300 ; 0
G1 X158 Y112.5 E0.07982 F300 ; 0
G1 X158 Y110.5 E0.07982 F300 ; 0
G1 E-0.5 F2400 ; retract
G1 X161 Y110.5 F30000 ; move to start
G1 E0.5 F2400 ; un-retract
G1 X161 Y110.9 E0.01596 F300 ; dot
G1 E-0.5 F2400 ; retract
G1 X162 Y110.5 F30000 ; move to start
G1 E0.5 F2400 ; un-retract
G1 X164 Y110.5 E0.07982 F300 ; 0
G1 X164 Y112.5 E0.07982 F300 ; 0
G1 X164 Y114.5 E0.07982 F300 ; 0
G1 X162 Y114.5 E0.07982 F300 ; 0
G1 X162 Y112.5 E0.07982 F300 ; 0
G1 X162 Y110.5 E0.07982 F300 ; 0
G1 E-0.5 F2400 ; retract
G1 X165 Y110.5 F30000 ; move to start
G1 E0.5 F2400 ; un-retract
G1 X165 Y112.5 F30000 ; move to start
G1 X167 Y112.5 E0.07982 F300 ; 6
G1 X167 Y110.5 E0.07982 F300 ; 6
G1 X165 Y110.5 E0.07982 F300 ; 6
G1 X165 Y112.5 E0.07982 F300 ; 6
G1 X165 Y114.5 E0.07982 F300 ; 6
G1 X167 Y114.5 E0.07982 F300 ; 6
G1 E-0.5 F2400 ; retract
G1 Z0.3 F300 ; zHop
G1 X158 Y120.5 F30000 ; move to start
G1 Z0.2 F300 ; zHop
G1 E0.5 F2400 ; un-retract
G1 X160 Y120.5 E0.07982 F300 ; 0
G1 X160 Y122.5 E0.07982 F300 ; 0
G1 X160 Y124.5 E0.07982 F300 ; 0
G1 X158 Y124.5 E0.07982 F300 ; 0
G1 X158 Y122.5 E0.07982 F300 ; 0
G1 X158 Y120.5 E0.07982 F300 ; 0
G1 E-0.5 F2400 ; retract
G1 X161 Y120.5 F30000 ; move to start
G1 E0.5 F2400 ; un-retract
G1 X161 Y120.9 E0.01596 F300 ; dot
G1 E-0.5 F2400 ; retract
G1 X162 Y120.5 F30000 ; move to start
G1 E0.5 F2400 ; un-retract
G1 X164 Y120.5 E0.07982 F300 ; 0
G1 X164 Y122.5 E0.07982 F300 ; 0
G1 X164 Y124.5 E0.07982 F300 ; 0
G1 X162 Y124.5 E0.07982 F300 ; 0
G1 X162 Y122.5 E0.07982 F300 ; 0
G1 X162 Y120.5 E0.07982 F300 ; 0
G1 E-0.5 F2400 ; retract
G1 X165 Y120.5 F30000 ; move to start
G1 E0.5 F2400 ; un-retract
G1 X165 Y122.5 F30000 ; move to start
G1 X165 Y124.5 F30000 ; move to start
G1 X167 Y124.5 E0.07982 F300 ; 7
G1 X167 Y122.5 E0.07982 F300 ; 7
G1 X167 Y120.5 E0.07982 F300 ; 7
G1 E-0.5 F2400 ; retract
G1 Z0.3 F300 ; zHop
G1 X158 Y130.5 F30000 ; move to start
G1 Z0.2 F300 ; zHop
G1 E0.5 F2400 ; un-retract
G1 X160 Y130.5 E0.07982 F300 ; 0
G1 X160 Y132.5 E0.07982 F300 ; 0
G1 X160 Y134.5 E0.07982 F300 ; 0
G1 X158 Y134.5 E0.07982 F300 ; 0
G1 X158 Y132.5 E0.07982 F300 ; 0
G1 X158 Y130.5 E0.07982 F300 ; 0
G1 E-0.5 F2400 ; retract
G1 X161 Y130.5 F30000 ; move to start
G1 E0.5 F2400 ; un-retract
G1 X161 Y130.9 E0.01596 F300 ; dot
G1 E-0.5 F2400 ; retract
G1 X162 Y130.5 F30000 ; move to start
G1 E0.5 F2400 ; un-retract
G1 X164 Y130.5 E0.07982 F300 ; 0
G1 X164 Y132.5 E0.07982 F300 ; 0
G1 X164 Y134.5 E0.07982 F300 ; 0
G1 X162 Y134.5 E0.07982 F300 ; 0
G1 X162 Y132.5 E0.07982 F300 ; 0
G1 X162 Y130.5 E0.07982 F300 ; 0
G1 E-0.5 F2400 ; retract
G1 X165 Y130.5 F30000 ; move to start
G1 E0.5 F2400 ; un-retract
G1 X165 Y132.5 F30000 ; move to start
G1 X167 Y132.5 E0.07982 F300 ; 8
G1 X167 Y130.5 E0.07982 F300 ; 8
G1 X165 Y130.5 E0.07982 F300 ; 8
G1 X165 Y132.5 E0.07982 F300 ; 8
G1 X165 Y134.5 E0.07982 F300 ; 8
G1 X167 Y134.5 E0.07982 F300 ; 8
G1 X167 Y132.5 E0.07982 F300 ; 8
G1 E-0.5 F2400 ; retract
G1 Z0.3 F300 ; zHop
G1 X158 Y140.5 F30000 ; move to start
G1 Z0.2 F300 ; zHop
G1 E0.5 F2400 ; un-retract
G1 X160 Y140.5 E0.07982 F300 ; 0
G1 X160 Y142.5 E0.07982 F300 ; 0
G1 X160 Y144.5 E0.07982 F300 ; 0
G1 X158 Y144.5 E0.07982 F300 ; 0
G1 X158 Y142.5 E0.07982 F300 ; 0
G1 X158 Y140.5 E0.07982 F300 ; 0
G1 E-0.5 F2400 ; retract
G1 X161 Y140.5 F30000 ; move to start
G1 E0.5 F2400 ; un-retract
G1 X161 Y140.9 E0.01596 F300 ; dot
G1 E-0.5 F2400 ; retract
G1 X162 Y140.5 F30000 ; move to start
G1 E0.5 F2400 ; un-retract
G1 X164 Y140.5 E0.07982 F300 ; 0
G1 X164 Y142.5 E0.07982 F300 ; 0
G1 X164 Y144.5 E0.07982 F300 ; 0
G1 X162 Y144.5 E0.07982 F300 ; 0
G1 X162 Y142.5 E0.07982 F300 ; 0
G1 X162 Y140.5 E0.07982 F300 ; 0
G1 E-0.5 F2400 ; retract
G1 X165 Y140.5 F30000 ; move to start
G1 E0.5 F2400 ; un-retract
G1 X167 Y140.5 E0.07982 F300 ; 9
G1 X167 Y142.5 E0.07982 F300 ; 9
G1 X165 Y142.5 E0.07982 F300 ; 9
G1 X165 Y144.5 E0.07982 F300 ; 9
G1 X167 Y144.5 E0.07982 F300 ; 9
G1 X167 Y142.5 E0.07982 F300 ; 9
G1 E-0.5 F2400 ; retract
G1 Z0.3 F300 ; zHop
;
; FINISH
;
G91 ;Relative positioning
G1 X5 Y5 F3000 ;Wipe out
G1 Z10 ;Raise Z more
G90 ;Absolute positioning
G1 X10 Y220 ;Present print
M106 S0 ;Turn-off fan
M104 S0 ;Turn-off hotend
M140 S0 ;Turn-off bed
M84 X Y E ;Disable all steppers but Z
;