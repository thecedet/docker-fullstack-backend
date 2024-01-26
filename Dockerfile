FROM maven:3.9.5-eclipse-temurin-17-alpine as builder

WORKDIR /usr/src/app

COPY . .
RUN mvn clean package -DskipTests=true

FROM eclipse-temurin:17-jre-alpine

COPY --from=builder /usr/src/app/target/*.jar /app.jar

EXPOSE 8080

ENTRYPOINT ["java"]
CMD ["-jar", "/app.jar"]
