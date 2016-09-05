@echo off
if +%1+==++ goto err
..\mk4s bmp2gfx %1
goto cont
:err
echo The usage is: bmp2gfx fname.bmp
:cont