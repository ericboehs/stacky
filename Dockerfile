FROM rails:4.2.6

EXPOSE 3000

RUN mkdir /app
WORKDIR /app

ENV BUNDLE_PATH /app_cache/bundle

ADD . /app

CMD bundle check || bundle && rails s -b 0.0.0.0
