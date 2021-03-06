#!/usr/bin/env bash
# shellcheck disable=SC2128
SOURCED=false && [ "$0" = "$BASH_SOURCE" ] || SOURCED=true

if ! $SOURCED; then
  set -euo pipefail
  IFS=$'\n\t'
fi

ERR_NOACCESS=1

function changedir {
  local new_dir="$1"
  cd "$new_dir" ||
    ( (>&2 echo "Could not access to $new_dir" ) && exit "$ERR_NOACCESS" )
}

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# get top-level directory of the report even if inside submodule
# See:
#   https://stackoverflow.com/a/7359782/2377454
repo_root="$(git rev-parse --show-superproject-working-tree --show-toplevel |\
             head -n1)"
changedir "$repo_root"

# set custom diff commands
git config diff.ipynb.textconv 'jupytext --pipe black --to jupytext//py --output -'

mkdir -p "${repo_root}/.git/info/"
cp -v "${repo_root}/setup/git/info"/* "${repo_root}/.git/info/"

mkdir -p "${repo_root}/.git/hooks/"
cp -v "${repo_root}/setup/git/hooks"/* "${repo_root}/.git/hooks/"

exit 0
