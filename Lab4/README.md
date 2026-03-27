# CST8915 Lab 1: Algonquin Pet Store on Azure VM

**Student Name**: Usama Iqbal
**Student ID**: 040777763
**Course**: CST8915 Full-stack Cloud-native Development
**Semester**: Winter 2026

---

## Demo Video

🎥 [Watch Demo Video] https://www.youtube.com/watch?v=AbGrXlLqLZc/www.youtube.com/watch?v=YOUR_VIDEO_ID

---

## Technical Explanations

### What are the main differences between a Docker image and a Docker container?

To explain the difference between a docker image and a docker container, we can look at it like object oriented programming, a docker image is like a class which is just a blue print whereas the docker container is an instance of that class. In docker we pull, tag or build images whereas in the case of containers we run, start, stop or rm containers. Multiple containers can be created from the same image. 

### Explain how Docker's layered architecture improves efficiency.
 This allowed shared storage and caching. If there are ten apps all based on python 3.9 for instance, without layering we would have ten full copies of the OS. With Layering Docker stores the base layer once on the host and every container running those apps references the same cached base layer thereby saving immensely on storage. 

 It also drastically enhances the build speed because the same concept of only building the changed segments of the container will get rebuilt and whatever is common between containers will use the shared components at the base layer. 

### Why does each container get its own writable layer?


When a container tries to modify a file that exists in a lower read only layer. Docker will automatically create a copy of that file up to the container that wants to copy it keeping the original file in all other containers. The original remains untouched. This prevents a container from corrupting a file that is shared among other containers.




## What are the benefits of using Docker Compose over running containers individually?

Running containers can be done individually. But running with docker compose ensures simpliefied networking because we do not need to create the network manually while using docker compose. Docker compose automatically creates a dedicated network for the project. Containers can find each other by their service name. Other benefits of docker compose include environment configuration for different environments such as DEV or PROD. For modern applications involving multiple components such as the Web Application, DB, Cache and a Rabbit MQ. We would need to start 4 separate terminals and run complex commansd on each. With Compose one compmand docker compose up will build the images, create all networks, start volumes and run the relevant containers in the correct dependency order e.g starting the database before starting the web application. 

---
