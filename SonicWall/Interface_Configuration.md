# Default Interface Configuration (Present on first boot)

# X0

```
ip-assignment LAN static
  ip 192.168.168.168
  netmask 255.255.255.0
  no gateway

management ping
management https
no management ssh
no user-login http
no user-login https
https-redirect
link-speed auto-negotiate
no shutdown-port
no flow-reporting
no management-traffic-only
```

# X1
```
ip-assignment WAN dhcp
  no hostname
  no renew-on-startup
  no renew-on-link-up
  no initiate-renewals-with-discover
  no force-discover-interval
  
no management ping
no management https
no management ssh
no https-redirect
link-speed auto-negotiate
no shutdown-port
no flow-reporting
no management-traffic-only
fragment-packets
no ignore-df-bit
send-icmp-fragmentation
```

# Wireless Default Configuration (present on first boot of SonicWall devices with wireless interfaces)

```
Coming soon...
```
