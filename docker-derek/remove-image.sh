IMAGE_NAME=`cat variables/IMAGE_NAME`

rm variables/*

echo ""
echo "Removing image $IMAGE_NAME:latest ..."
echo ""

docker image rm -f $IMAGE_NAME:latest
