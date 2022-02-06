@echo off 
set EMsoft_SDK=%cd%\EMsoft_SDK
cd EMsoft
echo "******************"
echo "Content of $EMsoft"
echo "------------------"
dir
echo "******************"
mkdir Release
cd Release

:: Disable PyEMEBSDDI because the system python is picked up...
:: Disable testing to avoid downloading EMsoftData
cmake -G "NMake Makefiles" ^
  -DCMAKE_BUILD_TYPE=Release ^
  -DEMsoft_ENABLE_TESTING=OFF ^
  -DBUILD_SHARED_LIBS=ON ^
  -DEMsoft_ENABLE_PyEMEBSDDI=ON ^
  -DPython3_EXECUTABLE=%PREFIX% ^
  -DPython_ROOT_DIR=$PREFIX ^
  -DPython_FIND_STRATEGY=LOCATION ^
  -DEMsoftWorkbench=OFF ^
  -DEMsoft_SDK=%EMsoft_SDK% ^
  -DFFTW3_INSTALL=%PREFIX% ^
  -DCMAKE_INSTALL_PREFIX=%PREFIX% ^
  ..
if errorlevel 1 exit 1

make -j 4
make install
