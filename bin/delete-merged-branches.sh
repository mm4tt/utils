#!/bin/bash

branches=$(git branch --merged | egrep -v "^(\*)?\s*master$")

if [[ -n "$branches" ]]; then
 echo "$branches" | xargs git branch -d
else
  echo "Nothing to delete"
fi
