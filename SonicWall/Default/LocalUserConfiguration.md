# Default Users Present

admin

# Create custom local users
```
user local
user $username password $password member-of $Group
commit
user $username
name $username
comit
  
exit
```

# Configure account expiry
## Note: Local users do not have the option to expire passwords without their group(s) being applied to the default sonicwall password policy
## Note: You must first create a local user in order to configure account expiry

```
user local
user $username
expiration YYYY:MM:DD HH:MM
commit
exit
```


# Best Practices

 - All users should be managed by a centralized database like Active Directory or other IAM/PAM solutions to allow consistent user monitoring across the board.
  - If there is need for local user accounts for administration, audited and monitored password requests for the device should be implemented. Using Playbooks (Ansible) or other Network Security Automation tools like Puppet that tie into SOAR operations is definitely recommended to act as a stand-in LAPS for local accounts on the SonicWall device. The more random and consistently reset the better.
  - You can also centrally manage and monitor account passwords/usage in most password management solutions.
