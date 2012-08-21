#!/usr/bin/env bash

check() {
    if [[ $1 != 0 ]]; then
      echo $2
      exit $1
    fi
}
    
echo Fetching latest revisions
git fetch

echo Rebasing on origin/develop
git checkout -b develop-temp
check $? "making temp branch"

git rebase develop
check $? "rebasing on develop"

git rebase
check $? "rebasing from origin"

git checkout develop
check $? "switching back to develop"

git merge develop-temp
check $? "merging changes from temp"

git push
check $? "pushing"

git branch -d develop-temp
check $? "removing temp branch"

