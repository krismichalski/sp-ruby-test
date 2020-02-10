# Smart Pension Ruby Test [![CircleCI](https://circleci.com/gh/krismichalski/sp-ruby-test.svg?style=svg)](https://circleci.com/gh/krismichalski/sp-ruby-test) [![Maintainability](https://api.codeclimate.com/v1/badges/28ed3799781cd4eac57e/maintainability)](https://codeclimate.com/github/krismichalski/sp-ruby-test/maintainability) [![Test Coverage](https://api.codeclimate.com/v1/badges/28ed3799781cd4eac57e/test_coverage)](https://codeclimate.com/github/krismichalski/sp-ruby-test/test_coverage)

Simple Ruby Log Parser which can display which path was visited the most - either total or unique count.

## Usage

Run the parser with the provided example log file via:

    ./bin/parser.rb webserver.log

This will by default count total number of visits. To see the unique count change the `mode` argument:

    ./bin/parser.rb webserver.log --mode=unique

## Setup the app for development

Install docker and docker-compose and ruby (see the version in `.ruby-version` file) on your machine:

    Consult the official docs for step-by-step instructions

Clone the repository:

    git clone <repo> sp-ruby-test
    cd sp-ruby-test

Copy the `.env.sample` file and follow the instructions inside it:

    cp .env.sample .env
    [open .env in file editor and follow instructions inside it]

Run setup script:

    bin/setup

If everything went well run the shell:

    bin/dc

### Tips & tricks to working with docker

##### .git/safe trick

Add `bin/` directory to your PATH using [.git/safe trick](https://thoughtbot.com/blog/git-safe).

With it you will be able to run `dc` script directly instead of typing `bin/dc`.

##### bin/dc script

Use `bin/dc` to run commands in the container (eliminates the need to type `docker-compose run --rm app [command]`).

You can even add the `bin/dc` script to your local editor settings!

For example for `vim-test` to work correctly, add to your `.vimrc.local` file:

    let test#ruby#rspec#executable = 'bin/dc rspec'

Usage examples (using `.git/safe trick` from above):

    dc bundle install
    dc rspec
    dc ash     # instead of bash, which is unavailable
