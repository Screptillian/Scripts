# Licensing

## Licensing Seats

 - How many workstations/servers/IoT licenses you have, how many are in use, and how many are available

## License Types
 - Discover and Protect
 - Protect and Response
 - Discover, Protect, and Response

### Located in Administration > Licensing

# Management Console Users

## Default
  - Admin

## Optional
 - LDAP Authentication
 - SAML Authentcation

## Permissions

|Permission|Description|
|---|---|
|User|Can view and edit information in all tabs except <b>Administration</b>|
|Admin|Can view and edit all information in the management console|
|Local Admin|<b>Multi-tenancy only</b> can view and edit all information for the assigned organization|
|Rest API|Can access the console through the API|

## User Authentication
 - Local Users are manually created and edited in the management console
 - Use LDAP authentication to authenticate users and assign permissions based on existing LDAP users
 - Requires a local core that can access the LDAP server
 - Use SAML authentication to authenticate users and assign permissions using a thrid-party identity provider (IdP)

# FortiEDR Account best practices
 - Members that are performing strictly analysis and response operations should use an account with <b>Only</b> the User permissions.
 - In cases of one FortiEDR environment, the account that should be used for console management is an account with "Admin" privileges.
 - Highly recommended to avoid the use of local accounts and tie to LDAP/SAML for <b>ALL</b> accounts needed to keep IAM procedures uniform across the board
 - 2FA on Local accounts is also <b>HIGHLY RECOMMENDED</b>, enabling 2FA on LDAP logins is done in the LDAP Authentication panel in the users administration area.

### User Administration options are available in the Administration tab of the Management console.

# Multi-Tenancy

## Why?
 - Assign collectors, cores, and threat hunting repositories to an organization.
 - Centrally manage policies, groups, and collectors.
 - View data from individual organizations as well as aggregated data
 - Allow organizations to view their own data.

## Multi-Tenancy Permissions

|Permission|Admin Account|Local Admin Account|User Account|
|---|---|---|---|
|View Single Organization Data|Y|Y|Y|
|Edit Single Organization Settings and Data|Y|Y|Y|
|View and Manage Single Organization Administrative Settings|Y|Y|N|
|Create and Manage Organizations|Y|N|N|
|View all Organizations|Y|N|N|
|View Global Data|Y|N|N|

### Multi-Tenancy Permissions best practices
 - If you have a SOC team devoted to 1 organization, SOC Members should have User accounts on the respective organizations/locations.
 - If you have a SOC team, that is spread across multiple organizations/locations you should have User accounts Admin accounts can be used, however it is advised to have separate User accounts for them on a per organization basis.
   - If you are an MSSP that provides SOC functions, Admin accounts can be used at the Senior level to allow the parsing of data for all organizations to identify trends and overarching problems.

### Multi-Tenancy Login Screen
 - Requires User name, password, and organization name.
  - If the organization name is left blank, the user is logged into the default organization IF they have permissions on/in the default organization.

### Organizations Pane
 - Located in <b>Administration > Organizations</b>
 - Only visible by Admin accounts

#### Create and Manage Organizations Permission capabilities
 - Create new organizations
 - Allocate workstation, server, and IoT device licenses to each organization
 - Assign or change an expiration date
 - Assign the registration password
 - Delete and organization (must have no collectors assigned to it)
 - Import an organization from another environment

# Admin Account Views

## Hoster View
 - Aggregated data for all organizations including:
  - Security Events
  - Exceptions
  - Security Policies
  - System components
  - Administrative data

## Organization View
 - Exceptions/Exclusions
 - Application usage data and aggregated application data
 - Threat-Hunting Settings
 - Security Policies
 - System Components
 - Administrative Data

# Migrating Organizations

## Overarching steps
 - 1. Export the organization from the source environment
 - 2. Import the organization into the destination environment
 - 3. Migrate the collectors

## Performing the Migration
 - There will be a status bar on the source environment during the migration.
 - Destination environment shows the collector in a <b>Disconnected (Pending Migration)</b> state until the migration is completed
 - Source Environment shows the collector in a <b>Disconnected (Migrated)</b> state after the migration is completed.

# Managing Collectors
 - By default only degraded collectors are shown under <b>INVENTORY > Collectors</b>
 - To view all collectors in your system, click <b>Show ALL Collectors</b>

## Uninstalling Collectors
 - You can uninstall collectors remotely from the <b>Inventory</b> tab <b>if they are connected</b>
 - If the collector is disconnected you can uninstall it manually from the device.


## Deleting a collector
 - Delete uninstalled collectors from the management console to reduce clutter
 - Deleting a collector does not uninstall it from the device.

## Collector States
|State|Description|
|---|---|
|Running|FortiEDR Collector is working with no issues|
|Running (Autonomously)|The Core is temporarily inaccessible, so policies will be enforced by the FortiEDR collector|
|Disconnected|The device is offline, powered down, or not connected to the FortiEDR Aggregator|
|Disconnected(Expired)|The device has not connected to the system in more than 30 days. FortiEDR automatically frees the license for other users|
|Pending Reboot|The FortiEDR collector is ready to run after this device is rebooted. Device must be rebooted manually.|
|Disabled|The FortiEDR collector was disabled in the FortiEDR Central Manager|
|Degraded|The FortiEDR collector is prevented from performing to its full capacity. Degraded status may be caused by compatibility issues or a lack of resources on the device.|

## Updating Collectors and Requesting Installers
 - Fortinet periodically sends content update files containing new collector builds and other updates
 - Upload content updates to the management console under <b>ADMINISTRATION > LICENSING</b>
 - Collectors can be updated remotely from the same are of the management console.
 - You can enable auto-updates under <b>ADMINISTRATION > LICENSING</b>
 - Fortinet recommends deploying collector updates in smaller batches to avoid any problems (testing)

### Request the latest installer
 - For new deployments you can also click <b>Request Collector Installer</b>

## Collector Modes

### High Security Collector Group
 - Built into the FortiEDR system and cannot be deleted
 - Management console <b>users</b> may choose which policies to apply
 - Fortinet recommends applying strict policies to this group to help contain infections

### Isolation Mode
 - Collectors in isolation mode are automatically assigned to the isolation policy in communication control
 - The isolation policy blocks communication from all applications by default
 - Collectors in isolation mode are marked with a specific icon in the <b>Inventory</b> tab
 - <b>Only new sessions after device isolation are blocked, not existing sessions</b>
 - <b>ICMP and incoming RDP connections are not blocked</b>

# System Components

 - By default, only degraded cores/aggregators are shown under <b>Inventory > System Components</b>
 - To view all cores/aggregators in your system click <b>Show All Cores</b> or <b>Show All Aggregators</b>
 - To view all repositories click <b>Repositories</b>

## System Components Information
### Core
  - IP Address, version, state
  - Deployment mode (cloud or on-premise)
  - Functionality
    - Core only
    - Jump Box
    - Both (Core + JumpBox)
    - <b>Note: JumpBox functionality is required for the Core to connect to LDAP servers</b>

### Aggregators
 - IP Address, version, state
 - Connected collectors

### Repositories
 - IP Address and state

# Managing IoT Devices
 - You can discover IoT devices on the Administration tab on the management console under <b>Tools > IoT Device Discovery</b>
  - For continuous discovery, enable the <b>Perform ongoing device discovery</b> option.
 - FortiEDR uses existing collectors to probe for neighboring devices

## Viewing IoT Devices
 - Located in <b>Inventory > IoT Devices</b>
  - Displays:
    - Device name
    - Category
    - IP Address
    - MAC Address
    - Location
    - First/Last seen dates

 - Devices discovered within the last 3 days are marked as <b>New</b>
 - Devices not seen in the last week are marked as <b>Expired</b>

### Organizing IoT Devices
 - Optionally auto-group devices by type
 - You can manually add groups and move devices as you would with collectors

# System Tools

## Audit Trails
 - Get a record of every user action on the management console
  - Located under <b>Administration > Tools</b>
  - Generates a CSV file listing the following for each user action:
    - Date: (yyyy-mm-dd hh:mm:ss)
    - Sub-System: (Configuration, Administration, Events, Inventory)
    - Username
    - Description
  - <b>Note: You can also send audit trails to your SIEM via syslog

## Component Authentication

### Device Registration Password
 - To install/uninstall a collector, you must supply the device registration password
 - The password is defined during initial system installation
 - The device registration password is the same for all collectors in the environment, or in the same organization in a multi-tenant environment.
  
#### Retrieving the Registration Password
  - Retrieved in: <b> Administration > Tools > Component Authentication > Display</b>
    - Password is shown in a pop-up window

## Configuring End-User Notifications
 - Configure what information users receive about collector status and activity
 - User notifications are configured <b>Globally</b>
 - You can customize pop-up notifications
    - For example if a trusted application has been blocked, contact the help desk at help@contoso.com

# Personal Data Handling

 - Find, report, and delete personal data for any user
  - GDPR compliant
  - Search for data by:
    - Device Name
    - IP Address
    - MAC Address
    - Username
  - To fully delete all data for an individual user, search for data related to each of the above criteria:
    - Deleting data for a username, for example, does not necessarily remove all data associated with that user's IP address, MAC address, or device name
  - <b>Note: To comply with GDPR, personal data deletion is not included in the audit logs</b>
  
# Windows Security Center
  - Located under <b>Administration > Tools > Windows Security Center</b>
  - You can enable the <b>Register Collectors to Windows Security Center</b> for full integration with Windows Security Center
  
# System Events
 - You can track events affecting the protection of user devices
  - Security issues logged
  - Core is down/restored
  - Aggregator is down/restored
  - Collector protection is OFF (state changed to degraded/disabled)/restored
  - Licenses issues logged:
    - License expiration (21/7/0 days until the expiration date)
    - License capacity (90%/95%/100% of license capacity consumed)
  - New collector added to the system

## Manage System Events
  - Events trigger real-time notifications through configured email or syslog
  - Export events to Excel or PDF
  
## Exporting System Events

### Email Notifications
  - Configure SMTP
    - To enable email notifications
  - <b>Note: If you delete or alter these settings all email alerts will be disabled</b>

#### Distribution Lists
  - <b>Note: FortiEDR comes with an "All Recipients" list, which cannot be used for notifications</b>
  - In the <b>Notifications</b> pane, make sure <b>System Events</b> are enabled
  - Add recipients as needed
  - Click a recipient's checkbox and select <b>Assign to List</b> to add them to your new list.
  
### Syslog
  - Automatically send FortiEDR event data to specified SIEM solutions through syslog
  - Configure syslog settings under <b>Administration > Export Settings > Syslog > Define new Syslog</b>
    - Click <b>Test</b> to verify parameters
    - Click <b>Save</b> to save parameters
  - Select your syslog definition, check the notifications area to the right and confirm that <b>System Events</b> are enabled
  
### Ticket notifications
  - Send events to event management tool
  - Enter System name and Email address, the destination where all tickets will be sent
  - Click <b>Save</b>
  
# Dashboard Overview
 - Charts
  - Security Events
  - Communication Control
  - Most Targeted
  - External Destinations
  - Health Charts
    - Collectors
    - System Components 
