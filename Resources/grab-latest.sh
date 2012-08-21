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

git rebase develop
check $? "rebasing on develop"

git checkout -b develop-temp
check $? "making temp branch"

git checkout develop
check $? "switching back to develop"

git merge develop-temp
check $? "merging local changes"

git branch -d develop-temp
check $? "removing temp branch"

# we should now be on a local develop branch incorporating any local changes
echo fetching latest revisions
git fetch

git rebase
check $? "rebasing on origin/develop"

git push
check $? "pushing"


