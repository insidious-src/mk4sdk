@echo off
if +%1+==++ goto err
..\mk4s gfx2bmp %1 %2
goto cont
:err
echo The usage is: gfx2bmp fname.gfx [noview]
:cont