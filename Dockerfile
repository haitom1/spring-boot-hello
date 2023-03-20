FROM openjdk:8-jdk-alpine
COPY target/spring-boot-hello-0.0.1-SNAPSHOT.jar spring-boot-hello-0.0.1-SNAPSHOT.jar
ENTRYPOINT ["java","-jar","/spring-boot-hello-0.0.1-SNAPSHOT.jar"]
