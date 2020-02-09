# Must be before the first FROM
# Used to determine the final base for the final image
# In development we want git, nodejs, yarn, etc to be present
# so we use builder as our final base
# In other environments we want to have as slim image as possible
# so we use core as our final base
ARG FINAL_BASE=core

# Allow minor ruby updates, but lock Alpine version
# Use multi-stage builds to reduce image size
FROM ruby:2.6-alpine3.10 AS core

# Set environment variables that shouldn't really be changed
# unless you know what you are doing, but feel free to add more if needed
ENV APP_ROOT=/home/docker/app \
    GEM_HOME=/home/docker/bundle \
    BUNDLE_PATH=/home/docker/bundle \
    BUNDLE_APP_CONFIG=/home/docker/bundle \
    PATH=/home/docker/bundle/bin:/home/docker/bundle/gems/bin:$PATH

# Install runtime dependencies
RUN apk add --no-cache \
    less

# Setup docker user
# DOCKER_USER_GID and DOCKER_USER_UID should stay as 9001
# unless developing natively under Linux,
# then it should match the user GUI and UID.
# If using Docker Toolbox, Docker for Mac/Windows
# or if build on CI/staging/production servers it should stay as 9001.
ARG DOCKER_USER_GID=9001
ARG DOCKER_USER_UID=9001
RUN addgroup -S docker -g $DOCKER_USER_GID \
 && adduser -S -G docker -u $DOCKER_USER_UID docker \
 && mkdir $APP_ROOT \
 && chown -R docker:docker /home/docker

# Setup workdir
WORKDIR $APP_ROOT

###################### BUILD STAGE START ############################

# Use common base
FROM core AS builder

# Install build dependencies
RUN apk add --no-cache \
    build-base \
    curl \
    git=~2.22

# Run install commands as docker user (to avoid file permissions issues)
USER docker

# DEV_ENV ARG controls whether or not we want to build a development-ready image
#   so if we want to run things like bundle install, etc.
ARG DEV_ENV="false"
ENV DEV_ENV=${DEV_ENV}

# Setup gems and bundler via environment variables
# BUNDLE_WITHOUT ARG controls what gem groups should not be installed
ARG BUNDLE_WITHOUT="development test"
ENV BUNDLE_RETRY=3 \
    BUNDLE_WITHOUT=${BUNDLE_WITHOUT}

# Copy ruby dependencies files
COPY --chown=docker Gemfile* $APP_ROOT/

# Install bundler
# If not in development run it respecting all the BUNDLE_ ENVs
# and remove gems cache
RUN gem install bundler:2.0.2 \
 && if [ "${DEV_ENV}" != "true" ]; then \
      bundle install \
      && rm -rf $GEM_HOME/cache/*.gem \
      && find $GEM_HOME/gems/ -name "*.c" -delete \
      && find $GEM_HOME/gems/ -name "*.o" -delete; \
    fi

# Return to root user so builder can be used as the final base image
USER root

###################### BUILD STAGE END ############################

# Use core or builder as base depending on the FINAL_BASE ARG
# and desired final image size
FROM ${FINAL_BASE}

# Copy ruby dependencies installed in build stage
COPY --chown=docker --from=builder $GEM_HOME/ $GEM_HOME/

# Run the app as non-root user (increase security)
USER docker

# Configure console and debuggers
COPY --chown=docker docker/irbrc /home/docker/.irbrc
COPY --chown=docker docker/pryrc /home/docker/.pryrc

# Copy the application code
COPY --chown=docker . $APP_ROOT/
