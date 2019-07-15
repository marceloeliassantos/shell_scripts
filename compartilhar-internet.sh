#!/bin/bash
iptables -A FORWARD -i enp1s0 -o enp1s0 -s 172.16.0.0/16 -m conntrack --ctstate NEW -j ACCEPT
 iptables -A FORWARD -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
iptables -A POSTROUTING -t nat -j MASQUERADE

sh -c "echo 1 > /proc/sys/net/ipv4/ip_forward"
