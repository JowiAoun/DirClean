FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
    shellcheck \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY . .

CMD ["shellcheck", "**/*.sh"]