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
