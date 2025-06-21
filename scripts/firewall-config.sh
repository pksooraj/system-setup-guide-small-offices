#!/bin/bash
# Linux iptables firewall configuration

# Flush existing rules
iptables -F
iptables -X

# Set default policies
iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT ACCEPT

# Allow loopback
iptables -A INPUT -i lo -j ACCEPT

# Allow established connections
iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT

# Allow SSH from trusted network
iptables -A INPUT -p tcp -s 192.168.1.0/24 --dport 22 -j ACCEPT

# Allow HTTP/HTTPS
iptables -A INPUT -p tcp --dport 80 -j ACCEPT
iptables -A INPUT -p tcp --dport 443 -j ACCEPT

# Allow VPN
iptables -A INPUT -p udp --dport 51820 -j ACCEPT

# Block common attack ports
iptables -A INPUT -p tcp --dport 135:139 -j DROP
iptables -A INPUT -p tcp --dport 445 -j DROP
iptables -A INPUT -p tcp --dport 1433 -j DROP

# Log blocked packets
iptables -A INPUT -j LOG --log-prefix "DROPPED: "

# Save rules (Debian/Ubuntu)
iptables-save > /etc/iptables/rules.v4
