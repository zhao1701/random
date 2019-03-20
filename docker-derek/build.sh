read -p "Enter image name: " IMAGE_NAME
echo $IMAGE_NAME > variables/IMAGE_NAME

echo ""
echo "Building image $IMAGE_NAME ..."

docker image build --build-arg http_proxy=$http_proxy --build-arg https_proxy=$https_proxy --build-arg no_proxy=$no_proxy -t ${IMAGE_NAME}:latest .
