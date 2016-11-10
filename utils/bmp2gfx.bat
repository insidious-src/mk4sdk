@echo off
cd raw
if +%1+==++ goto err
..\mk4s bmp2gfx %1
goto cont
:err
echo "Usage: bmp2gfx fname.bmp"
:cont

cd ..
