FROM python:3.13-alpine3.22

# PostgreSQL için gerekli paketler
RUN apk add --no-cache postgresql-dev

# SSH ve gerekli paketler
RUN apk add --no-cache openssh

ENV PYTHONUNBUFFERED=TRUE

ARG SSH_PRIVATE_KEY
ARG SSH_KNOWN_HOSTS

RUN mkdir -p /root/.ssh
RUN echo "$SSH_PRIVATE_KEY" > /root/.ssh/id_rsa
RUN echo "$SSH_KNOWN_HOSTS" > /root/.ssh/known_hosts
RUN chmod 600 /root/.ssh/id_rsa

# Çalışma dizinini belirle
WORKDIR /code

# Gereksinimleri kopyala ve yükle
COPY requirements.txt /code/
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Tüm proje dosyalarını kopyala
COPY . /code/