FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
    shellcheck \
    git \
    python3 \
    python3-venv \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY . .
    
RUN python3 -m venv venv
RUN /app/venv/bin/pip install --upgrade pip && \
    /app/venv/bin/pip install -r requirements.txt

RUN git init --initial-branch=main

RUN /app/venv/bin/pre-commit install

RUN chmod +x /app/bin/dirclean.sh
