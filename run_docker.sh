# docker run -p 3000:80

#  Build an image upon which your container will be built
docker build -t capstone-cloud-devops:dev .

# List docker Images
docker image ls

# Create and run container
docker run -it --rm \
-v ${PWD}:/app \
-v /app/node_modules \
-p 3000:80 \
-e CHOKIDAR_USEPOLLING=true \
capstone-cloud-devops:dev