#! /bin/sh

# exits shell if any error occurs
set -e

echo "Environment: $RAILS_ENV"

# install missing gems
# bundle check returns a non-zero exit code if not all the Gemfile requirements are satisfied
# --jobs 20 allows for up to 20 parallel gem downloads, --retry 5 allows up to 5 retries
bundle check || bundle install --jobs 20 --retry 5

# run whatever commands are passed in the bundle context
bundle exec ${@}