FROM ruby:3.0.0

RUN apt-get update -qq
RUN apt-get install -y nodejs postgresql-client

WORKDIR /app
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN bundle install
COPY . /app

EXPOSE 3001

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0", "-p", "3001"]