FROM ruby:2.4.1

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        postgresql-client \
        nodejs npm \
    && rm -rf /var/lib/apt/lists/*

run npm install n -g
run n 6.11

WORKDIR /usr/src/app
COPY rails_app/Gemfile* ./
RUN bundle install
COPY rails_app .

EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]