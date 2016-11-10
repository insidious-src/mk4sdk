@echo off

cd raw

if +%1+==++ goto err
..\fnd-obj %1 %2 %3
goto cont
:err
echo "Usage: geo2rax fname.geo"
:cont

cd ..
