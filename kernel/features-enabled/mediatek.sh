#!/bin/sh
export lpath=$1
export cname=$2

export configfile="$lpath/$cname"

./$lpath/scripts/config --file "$configfile" --enable CONFIG_MT7921_COMMON
./$lpath/scripts/config --file "$configfile" --enable CONFIG_MT7921E
./$lpath/scripts/config --file "$configfile" --enable CONFIG_MT7921S
./$lpath/scripts/config --file "$configfile" --enable CONFIG_MT7921U
./$lpath/scripts/config --file "$configfile" --enable CONFIG_MT792x_LIB
./$lpath/scripts/config --file "$configfile" --enable CONFIG_MWIFIEX_USB
./$lpath/scripts/config --file "$configfile" --enable CONFIG_MWIFIEX
./$lpath/scripts/config --file "$configfile" --enable CONFIG_MWIFIEX_PCIE
./$lpath/scripts/config --file "$configfile" --enable CONFIG_MWIFIEX_SDIO
./$lpath/scripts/config --file "$configfile" --enable CONFIG_WLAN_VENDOR_MEDIATEK
./$lpath/scripts/config --file "$configfile" --enable CONFIG_MWL8K
./$lpath/scripts/config --file "$configfile" --enable CONFIG_MT76x0U
./$lpath/scripts/config --file "$configfile" --enable CONFIG_MT76x0E
./$lpath/scripts/config --file "$configfile" --enable CONFIG_MT76x2E
./$lpath/scripts/config --file "$configfile" --enable CONFIG_MT76x2U
./$lpath/scripts/config --file "$configfile" --enable CONFIG_MT7603E
./$lpath/scripts/config --file "$configfile" --enable CONFIG_MT7615E
./$lpath/scripts/config --file "$configfile" --enable CONFIG_MT7663U
./$lpath/scripts/config --file "$configfile" --enable CONFIG_MT7663S
./$lpath/scripts/config --file "$configfile" --enable CONFIG_MT7915E
./$lpath/scripts/config --file "$configfile" --enable CONFIG_RTC_DRV_MT7622
./$lpath/scripts/config --file "$configfile" --enable CONFIG_MT7601U
./$lpath/scripts/config --file "$configfile" --enable CONFIG_MT76_CORE
./$lpath/scripts/config --file "$configfile" --enable CONFIG_MT76_LEDS
./$lpath/scripts/config --file "$configfile" --enable CONFIG_MT76_CONNAC_LIB
./$lpath/scripts/config --file "$configfile" --enable CONFIG_MT792x_LIB
