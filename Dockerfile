FROM ruby:2.4.1

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        postgresql-client \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src/app
COPY rails_app/Gemfile* ./
RUN bundle install
COPY rails_app .

EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]