# Security Validation Checklist

## Network Security Tests
- [ ] Run external port scan: `nmap -Pn -sS -T4 [public_IP]`
- [ ] Verify firewall rules: `iptables -L -v -n` (Linux) or `Get-NetFirewallRule` (Windows)
- [ ] Test DNS filtering: `nslookup malware-domain.com`
- [ ] Validate VLAN segmentation: Attempt cross-VLAN ping

## Server Security Tests
- [ ] SSH hardening test: `ssh -o PreferredAuthentications=none user@server`
- [ ] Check for open ports: `netstat -tuln`
- [ ] Verify encryption: `lsblk -o NAME,FSTYPE,MOUNTPOINT,ROTA` (Linux) or `Manage-bde -status` (Windows)

## Workstation Security Tests
- [ ] Verify screen lock: Test idle timeout
- [ ] Check admin privileges: `net localgroup administrators`
- [ ] Validate encryption status
- [ ] Test antivirus: Download EICAR test file

## Policy Compliance Tests
- [ ] Password strength test: Attempt weak password creation
- [ ] MFA test: Verify second factor requirement
- [ ] Backup restoration test
