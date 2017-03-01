FROM ruby:2.3.1

RUN apt-get update -qq && apt-get install -y \
  build-essential \
  libpq-dev \
  nodejs

RUN ln -s /usr/bin/nodejs /usr/bin/node

RUN mkdir /app
WORKDIR /app

COPY Gemfile* /app/

ENV RAILS_ENV production
ENV NODE_ENV production

RUN bundle install --deployment --without test development

COPY . /app
COPY config/application.yml /app/config/application.yml

ENV SECRET_KEY_BASE $(openssl rand -base64 32)
RUN rake assets:precompile

CMD ["rails", "server", "-b", "0.0.0.0"]
