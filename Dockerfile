FROM ruby:3.0.2-alpine

# Copy entrypoint and the actual Action Ruby script
COPY entrypoint.sh action.rb ./

# Update and install all of the required packages.
# At the end, remove the apk cache
RUN apk update && \
    apk upgrade && \
    apk add bash curl-dev ruby-dev build-base git ruby ruby-io-console ruby-bundler ruby-json ruby-rdoc && \
    chmod +x ./entrypoint.sh && \
    gem install octokit json && \ 
    rm -rf /var/cache/apk/*

ENTRYPOINT ["./entrypoint.sh"]
