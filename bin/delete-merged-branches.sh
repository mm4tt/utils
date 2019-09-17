#!/bin/bash

git branch --merged | egrep -v "^(\*)?\s*master$"  | xargs git branch -d
