FROM ruby:2.3.0-alpine
RUN apk add --update \
  build-base \
  libxml2-dev \
  libxslt-dev \
  postgresql-dev \
  && rm -rf /var/cache/apk/* \
  && mkdir /opt \
  && wget https://github.com/leszekbulawa/circleci-build-monitor/archive/master.zip -P /tmp \
  && unzip /tmp/master.zip -d /opt \
  && rm /tmp/master.zip

WORKDIR /opt/circleci-build-monitor-master

RUN bundle config build.nokogiri --use-system-libraries \
  && bundle install

CMD ["rails", "s", "-b", "0.0.0.0"]
