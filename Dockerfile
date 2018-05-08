###############################################
# Dockerfile to create a wiremock server using
# local wiremock configuration files
###############################################

FROM maven:3-jdk-9 as build

MAINTAINER TessaTech LLC

# Copy project POM
COPY ["pom.xml", "."]

# Execute mvn dependency:copy-dependencies to download latest version of jar
RUN ["mvn", "dependency:copy-dependencies", "-DoutputDirectory=/wiremock/."]

# Create second stage of build using alpine image
FROM openjdk:alpine
COPY --from=build /wiremock /wiremock

# Expose the Default Wiremock Port
EXPOSE 8080

# Change Working Directory to wiremock folder
WORKDIR /wiremock

# Set default entrypoint
ENTRYPOINT ["java", "-jar", "/wiremock/wiremock.jar"]

