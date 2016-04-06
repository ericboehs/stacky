FROM rails:4.2.6

EXPOSE 3000

RUN mkdir /app
WORKDIR /app

ENV BUNDLE_PATH /app_cache/bundle

COPY . /app

CMD bundle check || bundle && bundle exec puma -C config/puma.rb
