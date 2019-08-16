= Using iw =
== Check driver status ==
`lspci -k`

== Get name of interface ==
`iw dev`

== Get status of interface ==
`iw dev <interface> link`
or
`iw dev <interface> station dump` for more info

== Activate interface ==
`ip link set <interface> up`

== Find access points ==
`iw dev <interface> scan | less`
^you create the `wifiSearch` alias to do that
*Signal:* The closer it is to 0, the stronger the signal

== Setting up wifi in a new location ==
1. Get network name with `wifiSearch`
2. Find out interface name with `iw dev`
3. 


= Using nmcli =
- Let nmcli manage networking: `nmcli networking on`
- Check current connections: `nmcli c` which is short for `nmcli connection`
- Find networks to connect to: `nmcli device wifi`
- Connect to a network: `nmcli dev connect <network>`
^Wayyyy easier


= Using nmcli to turn off networking =
`nmcli device status` -- get device name
`nmcli device disconnect wlp2s0`
`nmcli device connect wlp2s0`
