# Galaxy Tab S9 for even more DeKnox
ADD_TO_WORK_DIR "gts9fexx" "system" "."

# KnoxGuard
DELETE_FROM_WORK_DIR "system" "system/priv-app/KnoxGuard"
DELETE_FROM_WORK_DIR "system" "system/etc/permissions/privapp-permissions-com.samsung.android.kgclient.xml"

# Blockchain
DELETE_FROM_WORK_DIR "system" "system/app/BlockchainBasicKit"
DELETE_FROM_WORK_DIR "system" "system/framework/service-samsung-blockchain.jar"
DELETE_FROM_WORK_DIR "system" "system/etc/sysconfig/preinstalled-packages-com.samsung.android.coldwalletservice.xml"
DELETE_FROM_WORK_DIR "system" "system/lib64/hidl_tlc_blockchain_comm_client.so"
DELETE_FROM_WORK_DIR "system" "system/lib64/libtlc_blockchain_comm.so"
DELETE_FROM_WORK_DIR "system" "system/lib64/libtlc_blockchain_keystore.so"
DELETE_FROM_WORK_DIR "system" "system/lib64/libtlc_blockchain_direct_comm.so"
DELETE_FROM_WORK_DIR "system" "system/lib64/vendor.samsung.hardware.tlc.blockchain@1.0.so"
SET_FLOATING_FEATURE_CONFIG "SEC_FLOATING_FEATURE_FRAMEWORK_SUPPORT_BLOCKCHAIN_SERVICE" --delete

# Payment
DELETE_FROM_WORK_DIR "system" "system/lib64/hidl_tlc_payment_comm_client.so"
DELETE_FROM_WORK_DIR "system" "system/lib64/libtlc_payment_direct_comm.so"
DELETE_FROM_WORK_DIR "system" "system/lib64/libtlc_payment_spay.so"
DELETE_FROM_WORK_DIR "system" "system/lib64/libtlc_payment_comm.so"
DELETE_FROM_WORK_DIR "system" "system/lib64/vendor.samsung.hardware.tlc.payment@1.0.so"

# MPOS
DELETE_FROM_WORK_DIR "system" "system/etc/permissions/privapp-permissions-com.samsung.android.knox.mpos.xml"
DELETE_FROM_WORK_DIR "system" "system/etc/permissions/com.samsung.android.nfc.mpos.xml"
DELETE_FROM_WORK_DIR "system" "system/framework/com.samsung.android.nfc.mpos.jar"
DELETE_FROM_WORK_DIR "system" "system/lib64/libhidl_comm_mpos_tui_client.so"
DELETE_FROM_WORK_DIR "system" "system/lib64/vendor.samsung.hardware.mpos-V1-ndk.so"
DELETE_FROM_WORK_DIR "system" "system/lib64/vendor.samsung.hardware.tlc.mpos_tui@1.0.so"
DELETE_FROM_WORK_DIR "system" "system/priv-app/KnoxMposAgent"

# Weaver
DELETE_FROM_WORK_DIR "system" "system/lib64/libhermes_cred.so"

# HDM
DELETE_FROM_WORK_DIR "system" "system/priv-app/HdmApk"
DELETE_FROM_WORK_DIR "system" "system/etc/permissions/privapp-permissions-com.samsung.android.hdmapp.xml"

# Knox ZeroTrust
DELETE_FROM_WORK_DIR "system" "system/etc/permissions/privapp-permissions-com.samsung.android.knox.zt.framework.xml"
DELETE_FROM_WORK_DIR "system" "system/priv-app/KnoxZtFramework"

# Other Knox APKs
DELETE_FROM_WORK_DIR "system" "system/priv-app/KPECore"
DELETE_FROM_WORK_DIR "system" "system/priv-app/KnoxCore"
DELETE_FROM_WORK_DIR "system" "system/priv-app/KnoxERAgent"
DELETE_FROM_WORK_DIR "system" "system/priv-app/KnoxFrameBufferProvider"
DELETE_FROM_WORK_DIR "system" "system/priv-app/KnoxNetworkFilter"
DELETE_FROM_WORK_DIR "system" "system/priv-app/KnoxNeuralNetworkRuntime"
DELETE_FROM_WORK_DIR "system" "system/priv-app/KnoxPushManager"
DELETE_FROM_WORK_DIR "system" "system/priv-app/KnoxSandbox"
DELETE_FROM_WORK_DIR "system" "system/priv-app/knoxanalyticsagent"
DELETE_FROM_WORK_DIR "system" "system/priv-app/knoxvpnproxyhandler"
DELETE_FROM_WORK_DIR "system" "system/etc/permissions/privapp-permissions-com.knox.vpn.proxyhandler.xml"
DELETE_FROM_WORK_DIR "system" "system/etc/permissions/privapp-permissions-com.samsung.android.knox.analytics.uploader.xml"
DELETE_FROM_WORK_DIR "system" "system/etc/permissions/privapp-permissions-com.samsung.android.knox.app.networkfilter.xml"
DELETE_FROM_WORK_DIR "system" "system/etc/permissions/privapp-permissions-com.samsung.android.knox.er.xml"
DELETE_FROM_WORK_DIR "system" "system/etc/permissions/privapp-permissions-com.samsung.android.knox.kfbp.xml"
DELETE_FROM_WORK_DIR "system" "system/etc/permissions/privapp-permissions-com.samsung.android.knox.knnr.xml"
DELETE_FROM_WORK_DIR "system" "system/etc/permissions/privapp-permissions-com.samsung.android.knox.kpecore.xml"
DELETE_FROM_WORK_DIR "system" "system/etc/permissions/privapp-permissions-com.samsung.android.knox.pushmanager.xml"
DELETE_FROM_WORK_DIR "system" "system/etc/permissions/privapp-permissions-com.samsung.android.knox.sandbox.xml"
