 This script is an attempt to automate picking up the latest version of the "develop" branch for a module, given that it might be on a detatch HEAD at the time.

 It performs the following steps:

 - rebase on the local develop branch
 - save this to a temporary branch
 - switch to the local develop branch
 - merge in the temporary branch - this should be a fast forward
 - remove the temporary branch
 - rebase on the remote "develop" from origin
 - push the resulting changed branch back to origin
