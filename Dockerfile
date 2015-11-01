FROM ruby:2.2

RUN apt-get update -y
RUN apt-get install -y iceweasel xvfb wget openjdk-7-jre-headless
RUN mkdir -p /usr/local/src
ADD Gemfile /usr/local/src/
ADD Gemfile.lock /usr/local/src/
ADD script/ /usr/local/src/
ADD run.sh /usr/local/src/
WORKDIR /usr/local/src/
RUN chmod +x run.sh reset.rb
RUN bundle install
RUN wget -q http://goo.gl/PJUZfa -O selenium-server-standalone.jar
CMD ./run.sh
