 This script is used in iOS targets that are packaged up as "pseudo" frameworks.

 The script is called from a Run Script phase, like this:

 "${ECCONFIG_SCRIPTS_PATH}/package-pseudo-framework.sh"

 It performs various linking and copying operations to lay out the framework bundle correctly.
