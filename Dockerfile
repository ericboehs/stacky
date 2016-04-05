FROM rails:4.2.6

EXPOSE 3000

RUN bundle config --global frozen 1

RUN mkdir /app
WORKDIR /app

ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock
RUN bundle install

ADD . /app

CMD rails s -b 0.0.0.0
