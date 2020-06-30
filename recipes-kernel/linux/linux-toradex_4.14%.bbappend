FILESEXTRAPATHS_append:= ":${THISDIR}/${PN}"
inherit toradex-kernel-config

SRC_URI_append = " \
	file://0001-arm64-dts-fsl-imx8qm-apalis-add-configuration-for-to.patch \
	file://0002-arm64-dts-fsl-imx8qxp-apalis-add-configuration-for-t.patch \
	file://0003-arm64-dts-fsl-imx8qxp-colibri-add-configuration-for-.patch \
	file://0001-fsl-imx8qxp-colibri-eval-v3.dtsi-enable-spidev0.patch \
	"

# Add symbols to make overlays work
EXTRA_OEMAKE += "'DTC_FLAGS=-@'"

kernel_do_configure_append() {
	# set kernel to reboot on panic and hung tasks
	kernel_configure_variable DETECT_HUNG_TASK y
	kernel_configure_variable DEFAULT_HUNG_TASK_TIMEOUT 120
	kernel_configure_variable BOOTPARAM_HUNG_TASK_PANIC y
	kernel_configure_variable SOFTLOCKUP_DETECTOR y
	kernel_configure_variable BOOTPARAM_SOFTLOCKUP_PANIC y
	kernel_configure_variable PANIC_ON_OOPS y
	kernel_configure_variable PANIC_TIMEOUT 5

	kernel_configure_variable CFS_BANDWIDTH y
	kernel_configure_variable SENSORS_SHT3x y
	kernel_configure_variable TOUCHSCREEN_ADS7846 y
	kernel_configure_variable TOUCHSCREEN_PROPERTIES y
	kernel_configure_variable TOUCHSCREEN_ADS7846 m
	kernel_configure_variable TOUCHSCREEN_AD7877 m
	kernel_configure_variable TOUCHSCREEN_AD7879 y
	kernel_configure_variable TOUCHSCREEN_AD7879_I2C y
	kernel_configure_variable TOUCHSCREEN_AD7879_SPI y
	kernel_configure_variable TOUCHSCREEN_ADC m
	kernel_configure_variable TOUCHSCREEN_AR1021_I2C m
	kernel_configure_variable TOUCHSCREEN_ATMEL_MXT m
	kernel_configure_variable TOUCHSCREEN_EDT_FT5X06 m
	kernel_configure_variable TOUCHSCREEN_EETI m
	kernel_configure_variable TOUCHSCREEN_EGALAX y
	kernel_configure_variable TOUCHSCREEN_MAX11801 y
	kernel_configure_variable TOUCHSCREEN_ELAN m
	kernel_configure_variable TOUCHSCREEN_ELO m
	kernel_configure_variable TOUCHSCREEN_GOODIX m
	kernel_configure_variable TOUCHSCREEN_IMX6UL_TSC y
	kernel_configure_variable TOUCHSCREEN_EDT_FT5X06 y
	kernel_configure_variable TOUCHSCREEN_MC13783 y
	kernel_configure_variable TOUCHSCREEN_MAX11801 m
	kernel_configure_variable SABRESD_MAX8903 n
	kernel_configure_variable TOUCHSCREEN_MC13783 m
	kernel_configure_variable TOUCHSCREEN_PENMOUNT m
	kernel_configure_variable TOUCHSCREEN_PIXCIR m
	kernel_configure_variable TOUCHSCREEN_RM_TS m
	kernel_configure_variable TOUCHSCREEN_ROHM_BU21023 m
	kernel_configure_variable TOUCHSCREEN_SILEAD m
	kernel_configure_variable TOUCHSCREEN_SIS_I2C m
	kernel_configure_variable TOUCHSCREEN_ST1232 m
	kernel_configure_variable TOUCHSCREEN_STMFTS m
	kernel_configure_variable TOUCHSCREEN_SX8654 m
	kernel_configure_variable TOUCHSCREEN_TSC200X_CORE y
	kernel_configure_variable TOUCHSCREEN_TSC2004 y
	kernel_configure_variable TOUCHSCREEN_TSC2007 y
	kernel_configure_variable TOUCHSCREEN_SX8654 y
	kernel_configure_variable TOUCHSCREEN_TSC2004 m
	kernel_configure_variable TOUCHSCREEN_TSC2005 m
	kernel_configure_variable TOUCHSCREEN_TSC2007 m
	kernel_configure_variable TOUCHSCREEN_TSC2007_IIO y
}
