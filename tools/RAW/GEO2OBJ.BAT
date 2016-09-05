@echo off
if +%1+==++ goto err
..\fnd-obj %1 %2 %3
goto cont
:err
echo The usage is: geo2obj fname.geo
:cont