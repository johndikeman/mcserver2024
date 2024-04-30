FROM openjdk:8-jre-slim

RUN apt-get update && apt-get install -y unzip curl && apt-get clean autoremove

VOLUME ["/app"]  # Define volume for server files

WORKDIR /app

RUN echo "eula=true" > eula.txt  # Create eula.txt with EULA agreement

ADD https://storage.googleapis.com/dikeman-mc-patched/mce_server_patched.zip /app

RUN unzip -q mce_server_patched.zip

EXPOSE 25565

ENTRYPOINT ["java", "-Xmx14G", "-Xms14G", "-jar", "minecraft_server.1.12.2.jar"]
