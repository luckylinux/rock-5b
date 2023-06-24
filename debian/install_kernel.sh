#!/bin/sh

set -e

main() {
    local kerndeb="$(ls ../kernel/linux-image-*.deb | sort | tail -n1)"
    if [ ! -e "$kerndeb" ]; then
        echo 'kernel .deb file not found'
        exit 1
    fi

    local imgfile='mmc_2g.img'
    if [ ! -e "$imgfile" ]; then
        echo 'mmc image file not found'
        exit 2
    fi

    kerndeb="$(realpath "$kerndeb")"  # /foo/bar/kern.deb
    local kerndir="$(dirname "$kerndeb")"   # /foo/bar
    local kernfile="$(basename "$kerndeb")" # kern.deb
    local kernver="$(echo "$kernfile" | sed -rn 's/linux-image-(.*)_[[:digit:]].*/\1/p')"

    print_hdr "mounting image"
    mkdir -p "$mountpt"
    mount -vno loop,offset=16M "$imgfile" "$mountpt"
    mount -vo bind "$kerndir" "$mountpt/mnt"

    mount -vt proc '/proc' "$mountpt/proc"
    mount -vt sysfs '/sys' "$mountpt/sys"
    mount -vo bind '/dev' "$mountpt/dev"
    mount -vo bind '/dev/pts' "$mountpt/dev/pts"

    print_hdr "installing kernel $kernver"
    chroot "$mountpt" "/usr/bin/dpkg" -i "/mnt/$kernfile"

    mv "$mountpt/boot/vmlinuz-$kernver" "$mountpt/boot/vmlinuz-$kernver.gz"
    gzip -d "$mountpt/boot/vmlinuz-$kernver.gz"

    [ -e "$mountpt/boot/dtb" ] && mv "$mountpt/boot/dtb" "$mountpt/boot/dtb.old"
    install -m 644 "$mountpt/lib/linux-image-$kernver/rockchip/rk3588-rock-5b.dtb" "$mountpt/boot/rk3588-rock-5b.dtb-$kernver"
    ln -svf "rk3588-rock-5b.dtb-$kernver" "$mountpt/boot/dtb"

    [ -e "$mountpt/boot/initrd.img" ] && mv "$mountpt/boot/initrd.img" "$mountpt/boot/initrd.img.old"
    ln -sfv "initrd.img-$kernver" "$mountpt/boot/initrd.img"

    [ -e "$mountpt/boot/vmlinuz" ] && mv "$mountpt/boot/vmlinuz" "$mountpt/boot/vmlinuz.old"
    ln -sfv "vmlinuz-$kernver" "$mountpt/boot/vmlinuz"
}

print_hdr() {
    local msg=$1
    echo "\n${h1}$msg...${rst}"
}

# ensure mount points get cleaned up
on_exit() {
    local uml
    for ep in 'dev/pts' 'dev' 'sys' 'proc' 'mnt' ''; do
        mountpoint -q "$mountpt/$ep" && uml="$uml $mountpt/$ep"
    done

    if [ -n "$uml" ]; then
        print_hdr "unmounting"
        for ep in $uml; do
            umount -v "$ep"
        done
    fi

    rm -rf "$mountpt"
}
mountpt='rootfs'
trap on_exit EXIT INT QUIT ABRT TERM

rst='\033[m'
bld='\033[1m'
red='\033[31m'
grn='\033[32m'
yel='\033[33m'
blu='\033[34m'
mag='\033[35m'
cya='\033[36m'
h1="${blu}==>${rst} ${bld}"

if [ 0 -ne $(id -u) ]; then
    echo 'this script must be run as root'
    echo "   run: ${bld}${grn}sudo sh $(basename $0)${rst}\n"
    exit 9
fi

cd "$(dirname "$(realpath "$0")")"
main $@

