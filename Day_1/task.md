1. Learned about Differences about the Virtual machines and Dockers

2. Purpose of the Docker
 
3. Docker Architecture

4. Creating a Docker File

FROM node:18-alpine
WORKDIR /app
COPY . .
RUN yarn install --production
CMD ["node", "src/index.js"]
EXPOSE 3000

5. Hands on Exercise how to build an image, Push to registry and Pull from registry

commands 
docker build -t appname .
docker images
docker login  
docker tag appname:latest username/repo:latest[ This will be docker hub]
docker push username/repo:latest

6. Learned the few more Docker Commands
   docker logs container_name 
   docker ps -a 
   docker rm imagename 
   docker rm containername 
   
