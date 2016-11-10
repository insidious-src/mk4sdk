@echo off

set FILE3D="00000.3d"
set FILEGEO="r000.geo"
set ASE23DLOG="ase23d_output.log"
set STRIPE3DLOG="stripe3d_output.log"

if not exist "raw\%1%.geo" (
    echo "Incorrect file name. The base file name must match a .geo file that already exists in folder 'raw'."
    echo "Usage: ase2geo <file name without '-0*.ase'>"
    exit /b 1
)

ase23d > "%ASE23DLOG%"

if not exist "%FILE3D%" (
   echo "%FILE3D% not found. Did you type the correct .ase & .hra files? Or you just forgot to press GO, bitch?"
) else (
    stripe3d > "%STRIPE3DLOG%";

    del _tmp*
    del tmp.obj*
    del ftex
    del fvrt
    del %FILE3D%

    if not exist "%FILEGEO%" (
       echo "Sorry, %FILEGEO% was NOT generated successfully!"
    ) else (
        move /n "raw\%~1.geo" "raw\%~1.geo.bak"
        move /f "$FILEGEO" "raw\%~1.geo"

        echo "%~1.geo generated and moved to RAW folder successfully. If you are done converting the texture file then it's safe to compile."
    )
)
