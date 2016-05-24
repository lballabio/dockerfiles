FROM ruby
MAINTAINER Luigi Ballabio <luigi.ballabio@gmail.com>
LABEL Description="An installation of GitHub Pages"

RUN gem install bundler
COPY Gemfile /srv/
RUN cd /srv && bundle install

EXPOSE 4000

RUN mkdir /srv/jekyll
WORKDIR /srv/jekyll

CMD jekyll serve --host 0.0.0.0

