@echo off 
setlocal EnableDelayedExpansion

set EMsoft_SDK=%cd%\EMsoft_SDK
cd EMsoftSuperbuild
echo "***************************"
echo "Content of EMsoftSuperbuild"
echo "---------------------------"
dir
echo "***************************"

mkdir Release
cd Release

cmake -G "NMake Makefiles" ^
  -DBUILD_SHARED_LIBS=OFF ^
  -DCMAKE_BUILD_TYPE=Release ^
  -DBUILD_NLOPT=OFF ^
  -DBUILD_FFTW=OFF ^
  -DBUILD_JSONFORTRAN=ON ^
  -DBUILD_BCLS=ON ^
  -DBUILD_CLFortran=ON ^
  -DBUILD_EIGEN=OFF ^
  -DBUILD_HDF5=ON ^
  -DBUILD_TBB=OFF ^
  -DINSTALL_QT5=OFF ^
  -DEMsoft_SDK=%EMsoft_SDK% ^
  ..
if errorlevel 1 exit 1

nmake
if errorlevel 1 exit 1
