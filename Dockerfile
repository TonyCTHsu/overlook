FROM ruby:2.5.5-alpine

RUN apk add --update build-base postgresql-dev tzdata
RUN gem install bundler

WORKDIR /app
ADD Gemfile Gemfile.lock /app/
RUN bundle install

ADD . .
CMD ["puma"]
