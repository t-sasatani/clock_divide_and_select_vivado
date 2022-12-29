@echo off
REM ****************************************************************************
REM Vivado (TM) v2022.1.1 (64-bit)
REM
REM Filename    : compile.bat
REM Simulator   : Xilinx Vivado Simulator
REM Description : Script for compiling the simulation design source files
REM
REM Generated by Vivado on Thu Dec 29 19:20:54 +0900 2022
REM SW Build 3557992 on Fri Jun  3 09:58:00 MDT 2022
REM
REM IP Build 3556342 on Fri Jun  3 19:31:36 MDT 2022
REM
REM usage: compile.bat
REM
REM ****************************************************************************
REM compile Verilog/System Verilog design sources
echo "xvlog --incr --relax -prj top_tb_vlog.prj"
call xvlog  --incr --relax -prj top_tb_vlog.prj -log xvlog.log
call type xvlog.log > compile.log
if "%errorlevel%"=="1" goto END
if "%errorlevel%"=="0" goto SUCCESS
:END
exit 1
:SUCCESS
exit 0
