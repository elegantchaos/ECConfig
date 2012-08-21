#!/usr/bin/env bash

check() {
    if [[ $1 != 0 ]]; then
      echo "failed: $2"
      exit $1
    fi
}

status=`git status --porcelain`

if [[ "$status" != "" ]]; then
    echo "You have local changes. Commit them first."
    exit 1
fi

# we may start on something that isn't the develop branch
# possibly a detached HEAD

# try to apply any changes on top of our local develop

git rebase develop
check $? "rebasing on develop"

# now fast forward develop to the merged place

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

# try to rebase again on top of any remote changes

git rebase
check $? "rebasing on origin/develop"

# if that worked, push back the merged version

git push
check $? "pushing"


