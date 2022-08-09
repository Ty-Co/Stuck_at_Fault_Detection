@echo off
set xv_path=C:\\Xilinx\\Vivado\\2016.2\\bin
call %xv_path%/xsim Circuit_SA1_tb2_behav -key {Behavioral:sim_1:Functional:Circuit_SA1_tb2} -tclbatch Circuit_SA1_tb2.tcl -view C:/Users/HotBox/Desktop/cecs361/project5/lab5/Circuit_SA1_tb2_behav1.wcfg -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
