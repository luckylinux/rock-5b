#!/bin/sh
export lpath=$1
export cname=$2

export configfile="$lpath/$cname"

./$lpath/scripts/config --file "$configfile" --enable CONFIG_RTL8180
./$lpath/scripts/config --file "$configfile" --enable CONFIG_RTL8187
./$lpath/scripts/config --file "$configfile" --enable CONFIG_RTL8192CE
./$lpath/scripts/config --file "$configfile" --enable CONFIG_RTL8192SE
./$lpath/scripts/config --file "$configfile" --enable CONFIG_RTL8192DE
./$lpath/scripts/config --file "$configfile" --enable CONFIG_RTL8723AE
./$lpath/scripts/config --file "$configfile" --enable CONFIG_RTL8723BE
./$lpath/scripts/config --file "$configfile" --enable CONFIG_RTL8188EE
./$lpath/scripts/config --file "$configfile" --enable CONFIG_RTL8192EE
./$lpath/scripts/config --file "$configfile" --enable CONFIG_RTL8821AE
./$lpath/scripts/config --file "$configfile" --enable CONFIG_RTL8192CU
./$lpath/scripts/config --file "$configfile" --enable CONFIG_RTL8XXXU
./$lpath/scripts/config --file "$configfile" --enable CONFIG_RTL8192U
