@echo off

set FC=%BUILD_PREFIX%\Library\bin\flang.exe

copy %RECIPE_DIR%\bld_EMsoftSDK.bat %SRC_DIR%
copy %RECIPE_DIR%\bld_EMsoft.bat %SRC_DIR%
copy %RECIPE_DIR%\bld_pyEMsoft.bat %SRC_DIR%

echo "********************"
echo "Content of %SRC_DIR%"
echo "--------------------"
dir
echo "********************"
echo "Building EMsoftSDK..."
call bld_EMsoftSDK.bat
echo "Building EMsoftSDK finished"

cd %SRC_DIR%
dir

echo "Building EMsoft"
call bld_EMsoft.bat
echo "Building EMsoft finished"

cd %SRC_DIR%

echo "Building pyEMsoft"
call bld_pyEMsoft.bat
echo "Building pyEMsoft finished"
