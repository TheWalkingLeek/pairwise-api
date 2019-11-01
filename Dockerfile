FROM ruby:1.9
ENV RAILS_ENV=development
WORKDIR /usr/src/pairwise-app
USER root
COPY Gemfile Gemfile.lock ./
COPY . /tmp/src
RUN gem install bundler -v 1.1.5
RUN bundle install
COPY . .

CMD bundle exec puma -p 3000
