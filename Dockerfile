FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
    shellcheck \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY . .

RUN chmod +x bin/dirclean.sh
