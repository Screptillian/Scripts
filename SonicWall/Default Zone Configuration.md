# Default Zones

## Present on all SonicWalls

LAN
WAN
DMZ
VPN
SSLVPN
MULTICAST

## Present on SonicWalls with wireless interfaces

WLAN

# Base Default Zone Configuration

## LAN

```
zone LAN
security-type trusted
interface trust
auto-generate-access-rules allow-from-to-equal
auto-generate-access-rules allow-from-higher
auto-generate-access-rules allow-to-lower
auto-generate-access-rules deny-from-lower
no client anti-virus
no client content-filtering
no gateway-anti-virus
no intrusion-prevention
no anti-spyware
no app-control
no dpi-ssl-client
no dpi-ssl-server
no create-group-vpn
no ssl-control
no sslvpn-access
no guest-services
```

## WAN

```
security-type untrusted
no interface-trust
auto-generate-access-rules allow-from-to-equal
auto-generate-access-rules allow-from-higher
auto-generate-access-rules allow-to-lower
auto-generate-access-rules deny-from-lower
no gateway-anti-virus
no intrusion-prevention
no anti-spyware
no app-control
no dpi-ssl-client
no dpi-ssl-server
create-group-vpn
no ssl-control
no sslvpn-access
```

## DMZ

```
security-type public
interface-trust
auto-generate-access-rules allow-from-to-equal
auto-generate-access-rules allow-from-higher
auto-generate-access-rules allow-to-lower
auto-generate-access-rules deny-from-lower
no client anti-virus
no client content-filtering
no gateway-anti-virus
no intrusion-prevention
no anti-spyware
no app-control
no dpi-ssl-client
no dpi-ssl-server
no create-group-vpn
no ssl-control
no sslvpn-access
no guest-services
```

## VPN

```
security-type encrypted
no interface-trust
auto-generate-access-rules allow-from-to-equal
auto-generate-access-rules allow-from-higher
auto-generate-access-rules allow-to-lower
auto-generate-access-rules deny-from-lower
no client anti-virus
no client content-filtering
no gateway-anti-virus
no intrusion-prevention
no anti-spyware
no app-control
no dpi-ssl-client
no dpi-ssl-server
no create-group-vpn
```

## SSLVPN
```
security-type sslvpn
no interface-trust
auto-generate-access-rules allow-from-to-equal
auto-generate-access-rules allow-from-higher
auto-generate-access-rules allow-to-lower
auto-generate-access-rules deny-from-lower
no client anti-virus
no client content-filtering
no gateway-anti-virus
no intrusion-prevention
no anti-spyware
no app-control
no dpi-ssl-client
no dpi-ssl-server
```

## MULTICAST
```
security-type untrusted
auto-generate-access-rules allow-from-to-equal
auto-generate-access-rules allow-from-higher
auto-generate-access-rules allow-to-lower
auto-generate-access-rules deny-from-lower
no create-group-vpn
```

## WLAN
```
security-type wireless
no interface-trust
auto-generate-access-rules allow-from-to-equal
auto-generate-access-rules allow-from-higher
auto-generate-access-rules allow-to-lower
auto-generate-access-rules deny-from-lower
no client anti-virus
no client content-filtering
no gateway-anti-virus
no intrusion-prevention
no anti-spyware
no app-control
no dpi-ssl-client
no dpi-ssl-server
create-group-vpn
no ssl-control
no sslvpn-access
no guest-services

wireless
  no sslvpn-enforcement
  sonicpoint profile n profile-name SonicPointN
  no sonicpoint profile n auto-provisioning
  sonicpoint profile ndr profile-name SonicPointNDR
  no sonicpoint profile ndr auto-provisioning
  sonicpoint profile ac profile-name SonicPointACe/ACi/N2
  no sonicpoint profile ac auto-provisioning
  sonicpoint profile wave2 profile-name SonicWave
  no sonicpoint porfile wave2 auto-provisioning
  only-sonicpoint-traffic
  no auto-channel-limitation
  sonicwave-online-registration
  sonicpoint-management
 
 no local-radius-server
```

# Zone Best Practices

## WAN

 - Should <b>NOT</b> have access to <b>ANY</b> zone regardless of device/device type that is on what would be the destination zone.
  - Traffic should not be going from WAN -> LAN (This is why we have a DMZ zone
 ### SSLVPN Access
  - SSLVPNs should not pass through the WAN zone inherently by default, all traffic from SSLVPN connections should pass to a centralized server (HTTPS Proxy)
  for maximum detective and response capabilities. Since the very aggressive move to remote work has taken over, remote access devices/protocols have become some
  of the biggest targets for attackers to attack. 
  
  [Hackers target staff working from home (protocols)](https://www.zdnet.com/article/big-jump-in-rdp-attacks-as-hackers-target-staff-working-from-home/)
   
  [5 Types of Remote Access Hacking Opportunities Hackers Exploit During COVID-19](https://en.cloudbric.com/blog/2020/06/5-types-remote-access-hacking-opportunities-covid-19/) 

## LAN

 - Should <b>NOT</b> inherently have access to the <b>WAN</b> zone. This is configured by default when a new SonicWall is booted up for the first time.
    - Due to it being a default policy, you can't edit the access rule without navigating to the diag page of your respective device and enabling editing of default access rules/policies.
 - Should <b>NOT</b> inherently be accessed by <b>ANY</b> zone. This zone should be the only zone with it's default level of security, all other zones should be treated as lower security zones in order to facilitate
   a policy structure similar to that of WAN -> LAN's.
   
## DMZ
 - This is the reference trust level of all non-LAN zoned networks, DMZ automatically has access to lower trusted networks (public/untrusted) because of the nature of the industries standard
design of a [https://www.barracuda.com/glossary/dmz-network](DMZ).
 - All Custom Zones should be designed with DMZ level security <b>OR</b> lower.

## VPN
 - All VPN tunnels should be bound to this zone <b>OR</b> a zone with identical security configuration(s) to control intra-VPN traffic coming in or leaving your network through a VPN tunnel.
   - This makes vendor relations that require VPNs much easier to maintain due to the inherent security-first mindset that needs to preside in order to make this configuration
 - VPN and DMZ zones have similar security functions between them, the difference between VPN and DMZ zones is VPN security type attribute is set to "Public" instead of "Encrypted"

## SSLVPN
 - The SSLVPN zone should only apply to the SSLVPN used/created/generated by the SonicWall itself. It is specifically designed to handle the SSLVPN zone.
  - If you require more than one SSLVPN zone (medium to enterprise sized clients) it is recommended that you pursue a more scalable solution (SonicWall SMA or similar devices)
 - SSLVPN users traffic should go direct all of their through a central server (HTTP(S) Proxy/DNS Server) to provide proper visibility into SSLVPN Users traffic.
 - The SSLVPN zone should <b>NOT</b> have carte blanch access into Trusted (LAN) zones and should have ports/services restricted to only what is needed.

## WLAN
 - Similar to the SSLVPN zone, the WLAN zone should be configured in a nearly identical way, differences stem mostly from the wireless configuration of the device/APs attached to the zone.
