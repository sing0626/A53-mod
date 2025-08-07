# Tee
DELETE_FROM_WORK_DIR "vendor" "tee/"
mkdir -p "$WORK_DIR/vendor/tee"

# Sepolicy
if ! grep -q "tee_file (dir (mounton" "$WORK_DIR/vendor/etc/selinux/vendor_sepolicy.cil"; then
    echo "(allow init_31_0 tee_file (dir (mounton)))" >> "$WORK_DIR/vendor/etc/selinux/vendor_sepolicy.cil"
    echo "(allow priv_app_31_0 tee_file (dir (getattr)))" >> "$WORK_DIR/vendor/etc/selinux/vendor_sepolicy.cil"
    echo "(allow init_31_0 vendor_fw_file (file (mounton)))" >> "$WORK_DIR/vendor/etc/selinux/vendor_sepolicy.cil"
    echo "(allow priv_app_31_0 vendor_fw_file (file (getattr)))" >> "$WORK_DIR/vendor/etc/selinux/vendor_sepolicy.cil"
    echo "(allow init_31_0 vendor_npu_firmware_file (file (mounton)))" >> "$WORK_DIR/vendor/etc/selinux/vendor_sepolicy.cil"
    echo "(allow priv_app_31_0 vendor_npu_firmware_file (file (getattr)))" >> "$WORK_DIR/vendor/etc/selinux/vendor_sepolicy.cil"
fi
