commandExists()
{
  command -v "$1" >/dev/null 2>&1
}

if ! commandExists git; then
  echo 'Git is not installed'
  exit 1
fi