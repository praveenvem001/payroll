FROM openjdk:8-jdk-alpine
ARG DEPENDENCY=target/dependency
ARG APP=target
COPY ${DEPENDENCY}/BOOT-INF/lib /app/lib
COPY ${DEPENDENCY}/META-INF /app/META-INF
COPY ${DEPENDENCY}/BOOT-INF/classes /app
COPY ${APP}/payroll-0.0.1-SNAPSHOT.jar /app.jar
EXPOSE 8080
ENTRYPOINT ["java","-cp","-Dspring.profiles.active=container","-jar","app.jar"]
