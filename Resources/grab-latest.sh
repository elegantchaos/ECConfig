#!/usr/bin/env bash

echo Fetching latest revisions
git fetch

echo Rebasing on origin/develop
git rebase origin/develop

