OS Configuration:

Automatic screen lock (5 mins).

Standard user accounts (no admin rights).

Security Tools:

Antivirus (ClamAV/Windows Defender).

Full-disk encryption.

Deployment Script:
# scripts/user-setup.ps1
Set-ExecutionPolicy RemoteSigned
Install-Module -Name SecurityCompliance -Force
