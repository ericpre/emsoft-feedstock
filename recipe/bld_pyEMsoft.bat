@echo off 
#cd f90wrap
#pip install .

cd $SRC_DIR/EMsoft/Release

echo '*************************'
echo 'Content of EMsoft/Release'
echo '-------------------------'
ls
echo '*************************'

bash run_pyEMsoft.sh
#bash run_docs.sh

cd pyEMsoft
$PYTHON -m pip install . -vv
