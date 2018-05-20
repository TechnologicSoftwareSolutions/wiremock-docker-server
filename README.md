# wiremock-docker-server
 
=======
wiremock-docker-server
========================
A minimal docker image for deploying a standalone WireMock server. 

[WireMock GitHub](https://github.com/tomakehurst/wiremock) 

[Docker Hub Page for Image](https://hub.docker.com/r/tessatech/wiremock-server/)

Motivation
----------
We created this base image to simplify the deployment of our mock services during our CD pipeline.

Internally, we use this as a base image to create versioned mocks of our services. During CD build of a service, we copy out the mock's json mapping files and build a docker image for that mock. That image then gets tagged against the build number and stored in Nexus, where it can be easily pulled for deployment, testing, and rollbacks.

How to Use
-----------
The built base image is available on Docker Hub at [tessatech/wiremock-server](https://hub.docker.com/r/tessatech/wiremock-server/)

Example usage can be found in the examples folder.

To build a new server extending our base image:
1. Create a new parent directory, named (for example) 'mock'
2. Create two folders inside the parent directory, '__files' and 'mappings'
3. Create your WireMock stubs and files as necessary
4. Place the following into a docker file alongside your parent
   ```
   FROM tessatech/wiremock-server:latest as build
   
   COPY ["mock", "/wiremock/"]
   ```
5. Build image
   ```
   docker build .
   ```
 
Questions and Comments
----------------------
If you have a question or comment, please send an email to support@tessatech.org

