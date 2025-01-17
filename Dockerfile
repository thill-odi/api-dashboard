FROM ruby:2.4.2

RUN apt-get update && \
  apt-get install -y net-tools

# Install gems
ENV APP_HOME /app
ENV HOME /root
RUN mkdir $APP_HOME
WORKDIR $APP_HOME
COPY Gemfile* $APP_HOME/
RUN bundle install

# Upload source
COPY . $APP_HOME

# Start server
ENV PORT 3000
EXPOSE 3000
CMD ["bundle", "exec", "rackup", "--host", "0.0.0.0", "-p", "3000"]
