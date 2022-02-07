#cd f90wrap
#pip install .

cd $SRC_DIR/EMsoft/Release

echo '*************************'
echo 'Content of EMsoft/Release'
echo '-------------------------'
ls
echo '*************************'

bash run_pyEMsoft.sh

cd $SRC_DIR/EMsoft/Release/pyEMsoft
$PYTHON -m pip install . -vv

cd $SRC_DIR/EMsoft/Release
bash run_docs.sh
