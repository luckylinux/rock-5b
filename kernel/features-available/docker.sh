#!/bin/sh
export lpath=$1
export cname=$2

export configfile="$lpath/$cname"

./$lpath/scripts/config --file "$configfile" --enable CONFIG_MEMCG_SWAP
./$lpath/scripts/config --file "$configfile" --enable CONFIG_BLK_DEV_THROTTLING
./$lpath/scripts/config --file "$configfile" --enable CONFIG_NET_CLS_CGROUP
./$lpath/scripts/config --file "$configfile" --enable CONFIG_CGROUP_NET_PRIO
./$lpath/scripts/config --file "$configfile" --enable CONFIG_CFS_BANDWIDTH
./$lpath/scripts/config --file "$configfile" --enable CONFIG_RT_GROUP_SCHED
./$lpath/scripts/config --file "$configfile" --enable CONFIG_IP_NF_TARGET_REDIRECT
./$lpath/scripts/config --file "$configfile" --enable CONFIG_IP_VS_NFCT
./$lpath/scripts/config --file "$configfile" --enable CONFIG_IP_VS_PROTO_TCP
./$lpath/scripts/config --file "$configfile" --enable CONFIG_IP_VS_PROTO_UDP
./$lpath/scripts/config --file "$configfile" --enable CONFIG_IP_VS_RR
./$lpath/scripts/config --file "$configfile" --enable CONFIG_SECURITY_SELINUX
./$lpath/scripts/config --file "$configfile" --enable CONFIG_SECURITY_APPARMOR
./$lpath/scripts/config --file "$configfile" --enable CONFIG_EXT3_FS_XATTR
./$lpath/scripts/config --file "$configfile" --enable CONFIG_EXT3_FS_POSIX_ACL
./$lpath/scripts/config --file "$configfile" --enable CONFIG_EXT3_FS_SECURITY
./$lpath/scripts/config --file "$configfile" --enable CONFIG_EXT4_FS_SECURITY
./$lpath/scripts/config --file "$configfile" --enable CONFIG_VXLAN
./$lpath/scripts/config --file "$configfile" --enable CONFIG_CRYPTO_SEQIV
./$lpath/scripts/config --file "$configfile" --enable CONFIG_XFRM
./$lpath/scripts/config --file "$configfile" --enable CONFIG_XFRM_USER
./$lpath/scripts/config --file "$configfile" --enable CONFIG_XFRM_ALGO
./$lpath/scripts/config --file "$configfile" --enable CONFIG_INET_ESP
./$lpath/scripts/config --file "$configfile" --enable CONFIG_NETFILTER_XT_MATCH_BPF
./$lpath/scripts/config --file "$configfile" --enable CONFIG_IPVLAN
./$lpath/scripts/config --file "$configfile" --enable CONFIG_DUMMY
./$lpath/scripts/config --file "$configfile" --enable CONFIG_NF_NAT_FTP
./$lpath/scripts/config --file "$configfile" --enable CONFIG_NF_CONNTRACK_FTP
./$lpath/scripts/config --file "$configfile" --enable CONFIG_NF_NAT_TFTP
./$lpath/scripts/config --file "$configfile" --enable CONFIG_NF_CONNTRACK_TFTP

# Not sure, this was about a "comment" error I got from netavark / iptables
./$lpath/scripts/config --file "$configfile" --enable CONFIG_NETFILTER_XT_MATCH_COMMENT
