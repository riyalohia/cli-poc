
# function getRepo() {
#   git clone git@github.com:riyalohia/wtunes.git && cd "$(basename "$_" .git)"
# }

# getRepo

PROJECT_URL="git@github.com:riyalohia/wtunes.git"
BASE_BRANCH=${3:-master}
PROJECT_NAME=$1

bootstrapApp(){
  cd $PROJECT_NAME
  git checkout $BASE_BRANCH
  git submodule foreach --recursive git checkout master
}

main() {
  if which tput >/dev/null 2>&1; then
      ncolors=$(tput colors)
  fi
  if [ -t 1 ] && [ -n "$ncolors" ] && [ "$ncolors" -ge 8 ]; then
    RED="$(tput setaf 1)"
    GREEN="$(tput setaf 2)"
    YELLOW="$(tput setaf 3)"
    BLUE="$(tput setaf 4)"
    BOLD="$(tput bold)"
    NORMAL="$(tput sgr0)"
  else
    RED=""
    GREEN=""
    YELLOW=""
    BLUE=""
    BOLD=""
    NORMAL=""
  fi

  printf "${BLUE}Cloning cards-library...${NORMAL}\n"
  hash git >/dev/null 2>&1 || {
    echo "Error: git is not installed"
    exit 1
  }

  # The Windows (MSYS) Git is not compatible with normal use on cygwin
  if [ "$OSTYPE" = cygwin ]; then
    if git --version | grep msysgit > /dev/null; then
      echo "Error: Windows/MSYS Git is not supported on Cygwin"
      echo "Error: Make sure the Cygwin git package is installed and is first on the path"
      exit 1
    fi
  fi

  env git clone $PROJECT_URL $PROJECT_NAME || {
    printf "Error: git clone of cards-library repo failed\n"
    exit 1
  }

  bootstrapApp






  printf "${GREEN}"
  echo ''
  echo ' /$$                                                       /$$           '
  echo ' |__/                                                      | $$          '
  echo '  /$$ /$$$$$$$           /$$$$$$$  /$$$$$$   /$$$$$$   /$$$$$$$  /$$$$$$$'
  echo ' | $$| $$__  $$ /$$$$$$ /$$_____/ |____  $$ /$$__  $$ /$$__  $$ /$$_____/'
  echo ' | $$| $$  \ $$|______/| $$        /$$$$$$$| $$  \__/| $$  | $$|  $$$$$$ '
  echo ' | $$| $$  | $$        | $$       /$$__  $$| $$      | $$  | $$ \____  $$'
  echo ' | $$| $$  | $$        |  $$$$$$$|  $$$$$$$| $$      |  $$$$$$$ /$$$$$$$/'
  echo ' |__/|__/  |__/         \_______/ \_______/|__/       \_______/|_______/ '
  echo ''
  echo '....is now installed!'
  echo ''
  echo ''
  printf "${NORMAL}"

}

main