FROM alpine:latest

RUN apk --update add openjdk7-jre

WORKDIR /app

EXPOSE 8080

COPY target/my-app-1.0-SNAPSHOT.jar /app

CMD ["java","-jar","/app/my-app-1.0-SNAPSHOT.jar"]
