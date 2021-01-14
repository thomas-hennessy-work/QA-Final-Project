FROM maven:3.6.3-jdk-8 AS build
COPY . .
RUN mvn clean package -Dmaven.test.skip=true

FROM java:8
COPY --from=build /target/spring-petclinic-rest-2.2.5.jar app.jar
EXPOSE 9966
ENTRYPOINT ["java", "-jar", "app.jar"]