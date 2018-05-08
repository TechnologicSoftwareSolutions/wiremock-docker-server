###############################################
# Example using the tessatech/wiremock-server 
# image to deploy a mock server
###############################################

FROM tessatech/wiremock-server:latest as build

MAINTAINER TessaTech LLC

# Copy mappings and __files directory to build
COPY ["mappings", "/wiremock/mappings/"]
COPY ["__files", "/wiremock/__files/"]

# 
FROM openjdk:alpine
COPY --from=build /wiremock /wiremock

# Expose the Default Wiremock Port
EXPOSE 8080

# Change Working Directory to wiremock folder
WORKDIR /wiremock

# Set default entrypoint
ENTRYPOINT ["java", "-jar", "/wiremock/wiremock.jar"]


