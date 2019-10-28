FROM ruby:1.9
ENV RAILS_ENV=development
WORKDIR /usr/src/pairwise-app
USER root
COPY Gemfile Gemfile.lock ./
COPY . /tmp/src
RUN gem install bundler -v 1.1.5
RUN bundle install
COPY . .

CMD ./bin/rake db:create; ./bin/rake db:test:load; ./bin/rake db:test:prepare; ./bin/rake db:migrate

CMD bundle exec ruby ./script/server -p 3000
