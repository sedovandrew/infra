#!/bin/bash

RUBY_VERSION=2.4.1

gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3

curl -sSL https://get.rvm.io  | bash -s stable

source ~/.rvm/scripts/rvm

rvm requirements

rvm install $RUBY_VERSION
rvm use $RUBY_VERSION --default

gem install bundler -V --no-ri --no-rdoc
