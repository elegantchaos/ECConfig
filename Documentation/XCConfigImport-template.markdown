Usage
-----

Annoyingly, Xcode doesn't look in the build products folder when searching for files included in xcconfig files.

This means that we can't include things from the XCConfig framework in a totally portable way, by doing

    #include <ECConfig/ECMacDebug.xcconfig>

Instead, we have to assume that the framework's source folder is actually at a known relative location.

If this isn't the case, you'll get a build warning:

    ECMacDebug.xcconfig line 8: Unable to find included file...

You can fix this by adding a symbolic link called ECConfig that points to the right place.

