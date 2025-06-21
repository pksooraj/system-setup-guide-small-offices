Hardware:

Firewall (pfSense/OPNsense) with IDS/IPS.

Switch (VLAN-capable).

Wi-Fi (WPA3, separate guest network).

Security:

Block inbound traffic by default.

Enable DNS filtering (e.g., Pi-hole).

Example firewall rule:
# templates/firewall_rules.txt
Block: 0.0.0.0/0 on ports 22, 135-139, 445
Allow: Trusted VPN IPs only
