cp $RECIPE_DIR/EMsoftSDK_build.sh $SRC_DIR
cp $RECIPE_DIR/EMsoft_build.sh $SRC_DIR
cp $RECIPE_DIR/pyEMsoft_build.sh $SRC_DIR

echo '*******************'
echo 'Content of $SRC_DIR'
echo '-------------------'
ls
echo '*******************'
echo "Building EMsoftSDK..."
bash EMsoftSDK_build.sh
echo "Building EMsoftSDK finished"

cd $SRC_DIR
ls

echo "Building EMsoft"
bash EMsoft_build.sh
echo "Building EMsoft finished"

cd $SRC_DIR

echo "Building pyEMsoft"
bash pyEMsoft_build.sh
echo "Building pyEMsoft finished"
