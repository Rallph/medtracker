# followed https://betterprogramming.pub/rails-6-development-with-docker-55437314a1ad with modifications relevant to our application

FROM ruby:2.6.6 
# inherit from official Ruby image with version 2.6.6

# set some environment variables (can be overwritten when running container)
ENV APP_PATH=/var/app
ENV BUNDLE_VERSION=1.17.2
ENV RAILS_PORT=3000

# ARGs are for build-time arguments only, do not persist to container runtime like ENVs
ARG NODE_VERSION=8

# add official nodejs repo
RUN curl -sL https://deb.nodesource.com/setup_$NODE_VERSION.x | bash -

# install packages
RUN apt-get update && apt-get install -y \ 
    git-core \ 
    curl \ 
    zlib1g-dev \ 
    build-essential \ 
    libssl-dev \ 
    libreadline-dev \ 
    libyaml-dev \ 
    libsqlite3-dev \ 
    sqlite3 \ 
    libxml2-dev \ 
    libxslt1-dev \ 
    libcurl4-openssl-dev \ 
    software-properties-common \ 
    libffi-dev \ 
    nodejs \
    && mkdir -p ${APP_PATH}


# install specified version of bundler
RUN gem install bundler --version "${BUNDLE_VERSION}"

# make the app directory the working directory
WORKDIR ${APP_PATH}

# expose the port for rails so it's accessible by the host
EXPOSE ${RAILS_PORT}

ENTRYPOINT ["bundle", "exec"]