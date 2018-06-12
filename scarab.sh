readonly COMMAND=$1
readonly PROJECT_NAME=$2
readonly CURRENT_NVM_VERSION="8.11.2"

# Print Scarab logo on screen. Such hype.
sh ./src/logo.sh

# Init function. Initializes the project for you.
function init {
  mkdir $PROJECT_NAME
  cd ./$PROJECT_NAME
  yarn init -y
  echo $CURRENT_NVM_VERSION >> .nvmrc
  touch index.js
  yarn global add rollup
}


case $COMMAND in
  
  # Invoke init function 
  init)
    init
    ;;

  # Default output if no match is found
  *)
  printf $"Usage: $0 { init | help | -v }\n"
  exit 1
  ;;

esac