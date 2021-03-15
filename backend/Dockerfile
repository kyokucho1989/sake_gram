FROM ruby:2.6.6

ENV LANG C.UTF-8
ENV TZ Asia/Tokyo

RUN mkdir /app
WORKDIR /app

ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock

RUN apt-get update -qq &&\
  apt-get install -y mariadb-client \
  libpq-dev \
  sudo \
  nginx && \
  gem install bundler:2.2.14

RUN bundle install

ADD . /app
RUN mkdir -p tmp/sockets

# nginx
RUN groupadd nginx
RUN useradd -g nginx nginx
ADD nginx/nginx.conf /etc/nginx/nginx.conf

EXPOSE 80

RUN ["chmod", "+x", "app/entrypoint.sh"]

CMD ["app/entrypoint.sh"]