export EMsoft_SDK=$(pwd)/EMsoft_SDK
cd EMsoft
echo '******************'
echo 'Content of $EMsoft'
echo '------------------'
ls
echo '******************'
mkdir Release
cd Release

# extract json-fortran version
json_fortran_version=$(conda list json-fortran -c) 
json_fortran_version="${json_fortran_version#*json-fortran-}"
json_fortran_version="${json_fortran_version%%-*}"

# Disable PyEMEBSDDI because the system python is picked up...
# Disable testing to avoid downloading EMsoftData
cmake \
  -DCMAKE_BUILD_TYPE=Release \
  -DEMsoft_ENABLE_TESTING=OFF \
  -DBUILD_SHARED_LIBS=ON \
  -DEMsoft_ENABLE_PyEMEBSDDI=OFF \
  -DPython_ROOT_DIR=$PREFIX \
  -DPython_FIND_STRATEGY=LOCATION \
  -DEMsoftWorkbench=OFF \
  -DEMsoft_SDK=$EMsoft_SDK \
  -DJSONFORTRAN_DIR=$PREFIX/lib/cmake/jsonfortran-gnu-$json_fortran_version/ \
  -DFFTW3_INSTALL=$PREFIX \
  -DCMAKE_INSTALL_PREFIX=$PREFIX \
  ..
make -j 4
make install
