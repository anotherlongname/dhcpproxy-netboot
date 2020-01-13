#!/bin/sh
echo "Updating SUBNET in config to ${SUBNET}"
sed -i "s/dhcp-range.*/dhcp-range=${SUBNET},proxy/g" /etc/dnsmasq.conf

mkdir /srv/tftp

KPXEFILE=/srv/tftp/netboot.xyz.kpxe
KPXELINK=https://boot.netboot.xyz/ipxe/netboot.xyz.kpxe
EFIFILE=/srv/tftp/netboot.xyz.efi
EFILINK=https://boot.netboot.xyz/ipxe/netboot.xyz.efi

echo "Downloading latest netboot files"
wget ${KPXELINK} -O ${KPXEFILE}
wget ${EFILINK} -O ${EFIFILE}

echo "Starting dnsmasq"
dnsmasq --no-daemon
