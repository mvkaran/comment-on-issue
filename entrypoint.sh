#!/bin/sh

set -e

sh -c "gem install octokit json"

sh -c "ruby /action.rb $*"