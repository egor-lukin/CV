FROM ruby:3.1.2-slim

RUN apt update && \
    apt-get install -y \
    bash \
    curl \
    tzdata \
    g++ \
    ruby-dev \
    gcc \
    make \
    musl-dev \
    pandoc \
    texlive-latex-base \
    texlive-fonts-recommended \
    texlive-extra-utils \
    texlive-latex-extra \
    shared-mime-info

RUN mkdir /app
WORKDIR /app

COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock

RUN gem install bundler:2.3.12 rake eventmachine
RUN bundle install --jobs 1

COPY . /app
