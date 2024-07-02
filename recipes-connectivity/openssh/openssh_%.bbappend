# disable rngd service for iMX7 devices since it fails because of CAAM driver initialization error
PACKAGECONFIG:remove:colibri-imx7-emmc = "rng-tools"

# disable rngd service for iMX6ULL devices since it fails because it doesn't have CAAM
PACKAGECONFIG:remove:colibri-imx6ull-emmc = "rng-tools"

FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI += "file://0001-Disable-race-condition-in-signal-handler-from-sshsig.patch"

