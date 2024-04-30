
FROM openjdk:8-jre-slim

RUN apt-get update && apt-get install -y unzip && apt-get clean autoremove

WORKDIR /app

RUN curl -L https://storage.googleapis.com/dikeman-mc-patched/mce_server_patched.zip -o server.zip

RUN unzip server.zip

EXPOSE 25565

ENTRYPOINT ["java", "-Xmx14G", "-Xms14G", "-jar", "minecraft_server.1.12.2.jar"]
