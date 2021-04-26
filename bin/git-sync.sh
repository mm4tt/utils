#!/bin/bash

set -euo pipefail

git checkout master
git fetch upstream
git reset --hard upstream/master
git push
