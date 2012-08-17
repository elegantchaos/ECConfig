#!/usr/bin/env bash

git submodule foreach 'git fetch; git rebase origin/master'
