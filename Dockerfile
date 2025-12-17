FROM ruby:3.3-bookworm

LABEL MAINTAINER="Amir Pourmand"

RUN apt-get update -y && apt-get install -y --no-install-recommends \
    locales \
    imagemagick \
    build-essential \
    zlib1g-dev \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*

# Set the locale
RUN sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen && \
    locale-gen
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# install jupyter
RUN python3 -m pip install jupyter --break-system-packages

# install jekyll and bundler
RUN gem install jekyll bundler

WORKDIR /srv/jekyll

# Copy Gemfile to container
COPY Gemfile /srv/jekyll/

# Install dependencies
RUN bundle install

# Set Jekyll environment
ENV JEKYLL_ENV=production

EXPOSE 8080

CMD ["/bin/bash", "-c", "rm -f Gemfile.lock && exec jekyll serve --watch --port=8080 --host=0.0.0.0 --livereload --verbose --trace"]
