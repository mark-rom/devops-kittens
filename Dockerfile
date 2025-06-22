FROM ruby:2.4.9

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

WORKDIR /app

COPY Gemfile Gemfile.lock ./

RUN bundle install

COPY . .

EXPOSE 1234

CMD ["bundle", "exec", "rackup", "--host", "0.0.0.0", "--port", "1234"]