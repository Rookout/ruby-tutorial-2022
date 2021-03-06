FROM ruby:2.7.6

WORKDIR /app
COPY Gemfile Gemfile.lock ./

RUN bundle config force_ruby_platform true
RUN bundle install

COPY . ./

EXPOSE 3000
CMD ["rails", "server", "-e", "development", "-b", "0.0.0.0"]
