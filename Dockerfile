FROM eclipse-temurin:25-jre AS build-final

RUN apt-get update && apt-get install -y pipx \
    && rm -rf /var/lib/apt/lists/*

RUN pipx install --include-deps pipx \
    && /root/.local/bin/pipx install --global --include-deps apprise

WORKDIR /app
COPY komf-app/build/libs/komf-app-1.0.0-SNAPSHOT-all.jar ./
ENV LC_ALL=en_US.UTF-8
ENV KOMF_CONFIG_DIR="/config"
ENTRYPOINT ["java","-jar", "komf-app-1.0.0-SNAPSHOT-all.jar"]
EXPOSE 8085

LABEL org.opencontainers.image.url=https://github.com/Snd-R/komf org.opencontainers.image.source=https://github.com/Snd-R/komf
