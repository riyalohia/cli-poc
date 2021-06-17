commandExists()
{
  command -v "$1" >/dev/null 2>&1
}

if ! commandExists git; then
  echo 'Git is not installed'
  exit 1
fi

# git ls-remote "$1" > /dev/null 2>&1
# if [ "$?" -ne 0 ]; then
#     echo "[ERROR] Unable to read from '$1'"
#     exit 1;
# fi

git clone git@github.com:riyalohia/wtunes.git
cd wtunes
