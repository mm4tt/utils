#!/bin/bash

git branch --merged | egrep -v "^(\*)?\s*master$"  | xargs --no-run-if-empty git branch -d
