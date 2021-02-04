# Dockerfile
# Use ruby image to build our own image
FROM ruby:2.7

RUN apt-get update && apt-get install apt-transport-https

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
  && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
  && curl -sL https://deb.nodesource.com/setup_8.x | bash -

RUN apt-get update && \
  apt-get install -y \
  yarn \
  nodejs

ENV APP_HOME /app
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

ADD Gemfile* $APP_HOME/
RUN bundle update --bundler
RUN bundle install

EXPOSE 3000

ADD . $APP_HOME

ENTRYPOINT [ "puma", "-C", "config/puma.rb" ]
