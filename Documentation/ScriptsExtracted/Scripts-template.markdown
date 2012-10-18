Scripts
-------

ECConfig contains a number of scripts used by ECConfig itself or by other EC Frameworks.

Some of these aren't really intended for public use, but they're all documented here just in case.


## backup-submodules.sh

Pushes all branches of all submodules in the current project to a remote called "backup".

Used internally.


## merge-latest-submodules.sh

Runs the merge-latest.sh script for each submodule in the current project.

Used internally.


## merge-latest.sh

This script is an attempt to automate picking up the latest version of the "develop" branch for a module, given that it might be on a detatch HEAD at the time.

It performs the following steps:

- rebase on the local develop branch
- save this to a temporary branch
- switch to the local develop branch
- merge in the temporary branch - this should be a fast forward
- remove the temporary branch
- rebase on the remote "develop" from origin
- push the resulting changed branch back to origin


## package-pseudo-framework.sh

This script is used in iOS targets that are packaged up as "pseudo" frameworks.

The script is called from a Run Script phase, like this:

    "${ECCONFIG_SCRIPTS_PATH}/package-pseudo-framework.sh"

It performs various linking and copying operations to lay out the framework bundle correctly.


## sign-bundled.sh



## testflight-extract-url.py



## testflight-upload.sh



## update-version.sh
- [backup-submodules.sh]
- [extract-script-docs.sh]
- [merge-latest-submodules.sh]
- [merge-latest.sh]
- [package-pseudo-framework.sh]
- [sign-bundled.sh]
- [testflight-extract-url.py]
- [testflight-upload.sh]
- [update-version.sh]
