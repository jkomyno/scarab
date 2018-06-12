#!/usr/bin/env bash

readonly COMMAND=$1
readonly PROJECT_NAME=$2
readonly CURRENT_NVM_VERSION="8.11.2"
readonly DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Print Scarab logo on screen. Such hype.
sh $DIR/src/logo.sh

# Init function. Initializes the project for you.
function init {
  # Make project directory
  mkdir $PROJECT_NAME
  cd ./$PROJECT_NAME

  # Store newly created project directory path
  readonly PROJECT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

  # Initialize yarn project
  yarn init -y

  # Add current nvm version to nvmrc file
  echo $CURRENT_NVM_VERSION >> .nvmrc

  # Create basic files and directories
  touch index.js
  echo "# ${PROJECT_NAME}" >> README.md
  mkdir tests
  mkdir dist
  mkdir src

  # Add Travis CI config file
  cat $DIR/src/travis.txt > .travis.yml

  # Add my standard eslint config file
  cat $DIR/src/eslintrc.txt > .eslintrc.js

  # Add gitignore file
  cat $DIR/src/gitignore.txt > .gitignore

  # Add Rollup as module bundler. I would like to check if it exisits globally
  # but installation takes less time than checking if it already exists.
  yarn global add rollup

  # Add some basic packages I always use
  yarn add -D jest

  # Run node script to change package.json content.
  # Pass newly created directory path as argv
  node $DIR/src/editPackage.js $PROJECT_DIR
}

function v {
  echo "0.0.1"
}

case $COMMAND in
  
  # Invoke init function 
  init)
    init
    ;;

  -v)
    v
  ;;

  # Default output if no match is found
  *)
  printf $"Usage: $0 { init | help | -v }\n"
  exit 1
  ;;

esac