# dhcpproxy-netboot
Docker container to create a simple all-in-one netboot.xyz PXE service without modifying your primary DHCP server


## Usage

The container needs to be run in `host` networking mode to correctly respond to the DHCP proxy requests.
Set the environment variable `SUBNET` to the subnet that you wish the DHCP proxy to respond on. You can use the IP address of your current host.

### Examples
Using docker CLI:
```
docker run --net=host -e SUBNET=192.168.2.0 anotherlongname/dhcpproxy-netboot
```

Using docker-compose:
```
version: '3.4'
services:
  dhcpproxy_netboot:
    container_name: dhcpproxy_netboot
    image: anotherlongname/dhcpproxy-netboot
    network_mode: host
    environment:
      - SUBNET=192.168.2.0
```
