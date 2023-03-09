FROM maven:3.6.3-jdk-11 AS builder
WORKDIR /opt/app
COPY . .
RUN mvn clean package

FROM registry.access.redhat.com/ubi9/openjdk-11
COPY --from=builder /opt/app/target/*.jar /spring-petclinic.jar
CMD java -jar /spring-petclinic.jar
EXPOSE 8080

