# Stage 1: Build the application
FROM maven:3.8.4-openjdk-17 as builder
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package

# Stage 2: Run the application with Jetty
FROM jetty:9.4-jre11
COPY --from=builder /app/target/*.war /var/lib/jetty/webapps/ROOT.war
