export EMsoft_SDK=$(pwd)/EMsoft_SDK
cd EMsoftSuperbuild
echo '***************************'
echo 'Content of EMsoftSuperbuild'
echo '---------------------------'
ls
echo '***************************'
mkdir Release
cd Release
cmake \
  -DBUILD_SHARED_LIBS=OFF \
  -DCMAKE_BUILD_TYPE=Release \
  -DBUILD_NLOPT=OFF \
  -DBUILD_FFTW=OFF \
  -DBUILD_JSONFORTRAN=OFF \
  -DBUILD_BCLS=ON \
  -DBUILD_CLFortran=ON \
  -DBUILD_EIGEN=OFF \
  -DBUILD_HDF5=ON \
  -DBUILD_TBB=OFF \
  -DINSTALL_QT5=OFF \
  -DEMsoft_SDK=$EMsoft_SDK \
  ..
make -j4
