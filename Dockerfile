FROM openjdk:8-jre-slim

RUN apt-get update && apt-get install -y unzip curl && apt-get clean autoremove

VOLUME ["/app"]  # Define volume for server files

WORKDIR /app

RUN echo "eula=true" > eula.txt  # Create eula.txt with EULA agreement

ADD https://storage.googleapis.com/dikeman-mc-patched/mce_server_patched.zip /app

RUN unzip -q mce_server_patched.zip

EXPOSE 25565

ENTRYPOINT [ "java", "-server", "-Xms10G", "-Xmx13G", "-XX:SurvivorRatio=4", "-XX:InitialSurvivorRatio=1", "-XX:NewRatio=4", "-XX:MaxTenuringThreshold=12", "-XX:+DisableExplicitGC", "-Dfml.doNotBackup=true", "-Dfml.readTimeout=65500", "-Dfml.loginTimeout=65500", "-jar", "forge-1.12.2-14.23.5.2860.jar", "nogui" ]
