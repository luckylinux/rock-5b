#!/bin/sh
export lpath=$1
export cname=$2

export configfile="$lpath/$cname"

./$lpath/scripts/config --file "$configfile" --enable CONFIG_DM_CRYPT
./$lpath/scripts/config --file "$configfile" --enable CONFIG_CRYPTO_AES_ARM64
./$lpath/scripts/config --file "$configfile" --enable CONFIG_CRYPTO_SERPENT
./$lpath/scripts/config --file "$configfile" --enable CONFIG_CRYPTO_TWOFISH
./$lpath/scripts/config --file "$configfile" --enable CONFIG_CRYPTO_LRW
