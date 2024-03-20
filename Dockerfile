# Start with a base image containing Java runtime
FROM openjdk:11

WORKDIR /app

COPY .mvn .mvn
COPY mvnw .
RUN chmod +x ./mvnw   

COPY pom.xml .

COPY src src
COPY frontend frontend

RUN ./mvnw package -Pproduction -DskipTests

EXPOSE 8080

ENTRYPOINT ["java","-jar","/app/target/plandesk.jar"]