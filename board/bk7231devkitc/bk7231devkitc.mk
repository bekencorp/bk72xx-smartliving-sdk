NAME := board_bk7231

JTAG := jlink

$(NAME)_TYPE := kernel
MODULE             := BK7231
HOST_ARCH          := ARM968E-S
HOST_MCU_FAMILY      := bk7231
SUPPORT_BINS         := no

$(NAME)_SOURCES := board.c

GLOBAL_INCLUDES += .
GLOBAL_DEFINES += STDIO_UART=1

CONFIG_SYSINFO_PRODUCT_MODEL := ALI_AOS_BK7231
CONFIG_SYSINFO_DEVICE_NAME   := BK7231


GLOBAL_CFLAGS += -DSYSINFO_PRODUCT_MODEL=\"$(CONFIG_SYSINFO_PRODUCT_MODEL)\"
GLOBAL_CFLAGS += -DSYSINFO_DEVICE_NAME=\"$(CONFIG_SYSINFO_DEVICE_NAME)\"

GLOBAL_LDS_INCLUDES += $(SOURCE_ROOT)/board/bk7231devkitc/bk7231devkitc.ld

# Extra build target in aos_standard_targets.mk, include bootloader, and copy output file to eclipse debug file (copy_output_for_eclipse)
EXTRA_TARGET_MAKEFILES +=  $(MAKEFILES_PATH)/aos_standard_targets.mk
ifeq ($(PING_PONG_OTA),1)
EXTRA_TARGET_MAKEFILES +=  $(SOURCE_ROOT)/platform/mcu/$(HOST_MCU_FAMILY)/gen_pingpong_bin.mk
else
EXTRA_TARGET_MAKEFILES +=  $(SOURCE_ROOT)/platform/mcu/$(HOST_MCU_FAMILY)/gen_crc_bin.mk
endif