FROM ruby:3.1.3-alpine3.16

LABEL maintainer="Robert Gauld <robert@robertgauld.uk>"

# Create and switch to user called app
RUN adduser -D app
WORKDIR /home/app

# Copy over app and install dependencies
RUN wget --quiet https://downloads.rclone.org/rclone-current-linux-amd64.zip && \
    unzip rclone-current-linux-amd64.zip && \
    mv rclone*/rclone /usr/bin/rclone && \
    rm -rf rclone*.zip rclone* && \
    chown root:root /usr/bin/rclone && \
    chmod 755 /usr/bin/rclone
COPY app/Gemfile app/Gemfile.lock /home/app/
RUN cd /home/app && bundle update --bundler && bundle install

# Copy rest of app
COPY app /home/app
RUN chown -R app:app /home/app && chmod -R u+w /home/app

CMD bundle exec run
