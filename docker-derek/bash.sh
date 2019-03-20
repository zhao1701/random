CONTAINER_NAME=`cat variables/CONTAINER_NAME`

echo ""
echo "Starting ZSH session in container $CONTAINER_NAME ..."
echo ""

docker container exec -it $CONTAINER_NAME zsh
