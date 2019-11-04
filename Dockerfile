FROM ruby:1.9
ENV RAILS_ENV=production
WORKDIR /usr/src/pairwise-app
USER root
COPY Gemfile Gemfile.lock ./
COPY . /tmp/src
RUN gem install bundler -v 1.1.5
RUN bundle install
COPY . .

CMD bundle exec passenger start -p 3000
