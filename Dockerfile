FROM ruby:2.3

RUN apt-get update && apt-get install -y apt-transport-https && \
  curl -s https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add - && \
  echo 'deb https://deb.nodesource.com/node_4.x jessie main' > /etc/apt/sources.list.d/nodesource.list && \
  echo 'deb-src https://deb.nodesource.com/node_4.x jessie main' >> /etc/apt/sources.list.d/nodesource.list && \
  apt-get update && \
  apt-get install -y nodejs postgresql-client

RUN npm install -g phantomjs-prebuilt

RUN curl -L https://github.com/docker/machine/releases/download/v0.6.0/docker-machine-Linux-x86_64 > /usr/local/bin/docker-machine && \
  chmod +x /usr/local/bin/docker-machine

EXPOSE 3000

RUN mkdir /app
WORKDIR /app

ENV BUNDLE_PATH /app_cache/bundle

COPY . /app

CMD bundle check || bundle && bundle exec puma -C config/puma.rb
