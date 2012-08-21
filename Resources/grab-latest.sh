#!/usr/bin/env bash

check() {
    if [[ $1 != 0 ]]; then
      echo "failed: $2"
      exit $1
    else
        echo $2
    fi
}

status=`git status --porcelain`

if [[ "$status" != "" ]]; then
    echo "You have local changes. Commit them first."
    exit 1
fi

echo fetching latest revisions
git fetch

git checkout -b develop-temp
check $? "making temp branch"

git checkout develop
check $? "switching back to develop"

git rebase develop
check $? "rebasing on develop"

git merge develop-temp
check $? "merging changes from temp"

git push
check $? "pushing"

git branch -d develop-temp
check $? "removing temp branch"

