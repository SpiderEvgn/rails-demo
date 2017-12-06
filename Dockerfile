FROM ubuntu:16.04

# Change APT source to Chinese mirror
ADD ./docker-build/sources.list /etc/apt/sources.list

RUN apt-get update && apt-get install -y curl apt-transport-https && \
  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
  apt-get clean && rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y \
  build-essential \
  libpq-dev \
  nodejs \
  ruby \
  ruby-dev \
  tzdata \
  yarn \
  zlib1g-dev \
  imagemagick && \
  apt-get clean && rm -rf /var/lib/apt/lists/*


ENV APP_HOME /app
WORKDIR $APP_HOME

RUN gem install bundler

ADD Gemfile* $APP_HOME/
RUN bundle install
