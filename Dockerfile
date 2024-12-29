FROM openjdk:8-jdk-alpine
RUN addgroup -S osboxes && adduser -S osboxes -G osboxes
USER osboxes
ARG JAR_FILE=target/*.jar
COPY ${JAR_FILE} app.jar
ENTRYPOINT ["java","-jar","/app.jar"]
