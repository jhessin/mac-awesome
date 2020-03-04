#!/usr/bin/env zsh

# First install the layout
cat ~/Downloads/Programmer\ Dvorak\ v1.2.pkg/Contents/Archive.pax.gz |\
 gunzip | ( cd / && sudo cpio --quiet -R root:admin -idm ./Library/Keyboard\ Layouts/Programmer\ Dvorak.bundle )	

# Then clear the cache
sudo rm -f /System/Library/Caches/com.apple.IntlDataCache.le*

# Then ensure that it is the only layout setup
for file in ~/Library/Preferences/com.apple.HIToolbox.plist; do
    for key in AppleCurrentKeyboardLayoutInputSourceID; do
        /usr/libexec/PlistBuddy -c "delete :${key}" ${file}
        /usr/libexec/PlistBuddy -c "add :${key} string 'com.apple.keyboardlayout.Programmer Dvorak'" ${file}
    done
    for key in AppleDefaultAsciiInputSource AppleCurrentAsciiInputSource AppleCurrentInputSource AppleEnabledInputSources AppleInputSourceHistory AppleSelectedInputSources; do
        /usr/libexec/PlistBuddy -c "delete :${key}" ${file}
        /usr/libexec/PlistBuddy -c "add :${key} array" ${file}
        /usr/libexec/PlistBuddy -c "add :${key}:0 dict" ${file}
        /usr/libexec/PlistBuddy -c "add :${key}:0:InputSourceKind string 'Keyboard Layout'" ${file}
        /usr/libexec/PlistBuddy -c "add ':${key}:0:KeyboardLayout ID' integer 6454" ${file}
        /usr/libexec/PlistBuddy -c "add ':${key}:0:KeyboardLayout Name' string 'Programmer Dvorak'" ${file}
    done
done

# Now set it as the login layout
sudo cp ~/Library/Preferences/com.apple.HIToolbox.plist /Library/Preferences/
