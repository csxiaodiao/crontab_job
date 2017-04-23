#!/bin/bash
source ~/.profile

cd `dirname $0`

FILE=target.conf

cat $FILE | while read line; do
  cd "$line"
  if [[ -z $(git status -s) ]]; then
    echo "tree is clean"
  else
    backtime=$(date "+%Y-%m-%d %H:%M:%S")
    desc="auto commit by crontab job ${backtime}"
    current_branch=$(git rev-parse --abbrev-ref HEAD)

    git add . && \
    git add -u && \
    git commit -m "$desc" && \
    git push origin "$current_branch"

    echo "auto commit by crontab job ${backtime} id finished"
    exit
  fi
done

