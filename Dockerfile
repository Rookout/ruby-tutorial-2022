FROM ruby:3.1.2

WORKDIR /app
COPY Gemfile Gemfile.lock ./

RUN bundle config force_ruby_platform true
RUN bundle install

COPY . ./

CMD ["rails", "server", "-p", "8080", "-e", "development", "-b", "0.0.0.0"]
