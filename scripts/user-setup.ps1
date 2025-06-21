# Windows Workstation Security Configuration
# Requires admin privileges

# Password Policy
Set-LocalUser -Name "Administrator" -PasswordNeverExpires $false
net accounts /maxpwage:90 /minpwlen:12 /uniquepw:5

# Enable BitLocker (if hardware supports)
Enable-BitLocker -MountPoint "C:" -EncryptionMethod XtsAes256 -UsedSpaceOnly -RecoveryPasswordProtector

# Configure Windows Defender
Set-MpPreference -DisableRealtimeMonitoring $false -DisableBehaviorMonitoring $false
Update-MpSignature

# User Account Control (Max setting)
New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "EnableLUA" -Value 1 -PropertyType DWORD -Force
New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "ConsentPromptBehaviorAdmin" -Value 2 -PropertyType DWORD -Force

# Disable SMBv1
Disable-WindowsOptionalFeature -Online -FeatureName "SMB1Protocol" -NoRestart

# Disable legacy protocols
New-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\SSL 2.0\Server" -Name "Enabled" -Value 0 -PropertyType DWORD -Force
New-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.0\Server" -Name "Enabled" -Value 0 -PropertyType DWORD -Force

# Screen lock policy
powercfg /SETACVALUEINDEX SCHEME_CURRENT SUB_VIDEO VIDEOCONLOCK 300
Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name "ScreenSaverIsSecure" -Value 1

# Create standard user
$securePass = ConvertTo-SecureString "InitialPass123!" -AsPlainText -Force
New-LocalUser -Name "StandardUser" -Password $securePass -FullName "Standard User" -Description "Non-admin account"
Add-LocalGroupMember -Group "Users" -Member "StandardUser"
