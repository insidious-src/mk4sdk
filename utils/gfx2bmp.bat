@echo off

cd raw

if +%1+==++ goto err
..\mk4s gfx2bmp %1 %2
goto cont
:err
echo "Usage: gfx2bmp fname.gfx [noview]"
:cont

cd ..
