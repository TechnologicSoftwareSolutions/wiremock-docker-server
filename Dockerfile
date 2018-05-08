###############################################
# Dockerfile to create a wiremock server using
# local wiremock configuration files
###############################################

FROM alpine:3.5 as build

MAINTAINER TessaTech LLC

# Download Wiremock from Repository
ADD http://repo1.maven.org/maven2/com/github/tomakehurst/wiremock-standalone/2.17.0/wiremock-standalone-2.17.0.jar /wiremock/wiremock.jar

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


