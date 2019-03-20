while [ -z $CONTAINER_NAME ]; do
    read -p "Enter container name: " CONTAINER_NAME
done

while [ -z $PROJECT_DIR ]; do
    read -p "Enter local project directory: " PROJECT_DIR
done

read -p "Enter data directory: " DATA_DIR
echo $CONTAINER_NAME > variables/CONTAINER_NAME
IMAGE_NAME=`cat variables/IMAGE_NAME`
PORTS="8000-8010"

echo ""
echo "Starting container $CONTAINER_NAME from image $IMAGE_NAME ..."
echo ""

if [ -z ${DATA_DIR} ]; then
    docker run -d \
        --shm-size=1g --privileged=true \
        -e http_proxy=$http_proxy \
        -e https_proxy=$https_proxy \
        -e no_proxy=$no_proxy \
        -p ${PORTS}:${PORTS} \
        -v ${PROJECT_DIR}:/project/ \
        --name ${CONTAINER_NAME} ${IMAGE_NAME}:latest
else
    docker run -d \
        --shm-size=1g --privileged=true \
        -e http_proxy=$http_proxy \
        -e https_proxy=$https_proxy \
        -e no_proxy=$no_proxy \
        -p ${PORTS}:${PORTS} \
        -v ${PROJECT_DIR}:/project/ \
        -v ${DATA_DIR}:/data/
        --name ${CONTAINER_NAME} ${IMAGE_NAME}:latest
fi

docker ps | grep ${CONTAINER_NAME} 

