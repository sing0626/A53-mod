SET_PROP "system" "ro.unica.version" "$ROM_VERSION"
SET_PROP "system" "ro.unica.codename" "$ROM_CODENAME"

# ro.build.2ndbrand is always "false"
LOG "- Disabling ASKS"
sed -i "s/ro.build.official.release/ro.build.2ndbrand/g" "$APKTOOL_DIR/system/framework/services.jar/smali/com/android/server/asks/ASKSManagerService.smali"
