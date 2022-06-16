# The Malware Challenge

 - 350,000 new malicious and potentially unwanted programs registered by AV-TEST daily
 - Total of more than 1 billion known malware samples

# A New Way of Thinking
 - You can't keep everything out, FortiEDR monitors for Post-Exploitation (Malicious) Activities.

# Why FortiEDR?
 - Protection
  - Pre-infection and post-infection protection stops or at the very least alerts on the breach
 - Management
  - Single console that inherently eliminates alert clutter
 - Scalability
  - Deploy lightweight agent across an array of use cases
 - Flexibility
  - Protect a broad range of operating systems environments, even when offline.
 - Cost
  - Helps eliminate/minimize post-breach operation expenses and breach damage

# Multi-Layered Protection
 - FortiEDR is a NGAV (Next-Generation Anti-Virus) provider
 - Execution Prevention
  - Machine Learning, kernel-based next-generation antivirus
  - Feeds from a continuously updated cloud databse (FortiLabs)
 - Data Exfiltration Prevention
  - Discover and track applications and Internet of Things (IoT) devices
  - Common Vulnerabilities and Exposures (CVE) and application rating data enrichment
  - Risk-based proactive policies enable attack surface reduction

# Ransomware Prevention
 - Automated post-infection detection and blocking
 - Real-Time automated prevention of ransomware encryption and data theft
 - OS-Centric Technology
 - Analysis of entire log history
 - Surgical containment

# Threat Hunting
 - Detecting, investigating, containing, and mitigating suspicious activities (WRONG)
  - Expanding on Threat Hunting definition: A process using new information on previously collected data to find signs of compromise evading detection. Usually, it is very manual and human-centric activity. It takes a proactive approach to detection; thus it is not based on signatures.

# Fortinet Endpoint Security Solution
 - Comprised of:
  - FortiClient EMS
  - FortiEDR

# FortiEDR Components

## FortiEDR Collector
 - Lean collector (agent) that resides on the operating system on every communicating device in your enterprise.
  - Includes desktops, laptops, and servers.
 
## FortiEDR Core
 - Security Policy enforcer and decision-maker
 - Detects and blocks suspicious connections

## Threat Hunting Repository
 - Find and delete known malware on any device within the system
 - <b>Requires a license</b>

## FortiEDR Aggregator
 - Provides processing and load handling services for the Central Manager
 - Usually runs on the same system as the FortiEDR Central Manager in smaller installations
 - Large deployments may require multiple aggregators on separate servers

## FortiEDR Central Manager
 - Software-only central web user interface and back-end server for viewing and analyzing events and configuring the system


## FortiEDR Cloud Services (FCS)
 - Cloud based, softare-only service that verifies classification of security events with high accuracy and acts accordingly
 - Responsible for managing all investigation actions


# Traffic Flow
 - 1. Collector to Aggregator
  - Connect to Aggregator
  - Aggregator responds with license and configuration file
    - Configuration file includes a list of cores that the collector is allowed to communicate with.
      - Up to 11 cores per aggregator
  - Collector then tests the connections to each core and selects the one with the fastest connection
  - Core handles policy enforcement, if the collector detects malicious/suspicious activities, the collector sends the core compressed OS metadata to the core for evaluation
  - Core sends back a GO or NO GO on the event based on existing policies, then sends alert data and policy action to the aggregator and FortiEDR Cloud Services (FCS), aggregator then forwards the event to the Central Manager and , Central Manager then displays it in the GUI.
    - In the event of malicious/suspicious activity, in addition to alert data and policy action being sent to FortiEDR Cloud Services (FCS) it also sends information about executables detected on each collector to the threat hunting repository.
      - Threat Hunting repository communicates to the Central Manager, you can filter executables on the GUI.

# Network Communication Requirements

|Device1|Device2|TCP/IP Port|Purpose|
|---|---|---|---|
|Collector|Aggregator|8081|Registration and Status|
|Collector|Core|555|Compressed OS metadata|
|Core|Aggregator|8081|Registration Status and Events|
|Core|Threat Hunting Repository|443|Threat Hunting Capabilities|
|Core|[reputation.ensilo.com:443](FortiEDR Reputation Service)|443|Check Reputation of Applications|
|Aggregator|Central Manager|443|Events, Configuration|
|Admin PC|Central Manager|443|GUI Access|
|Manager|Syslog|6514|TCP and SSL recommended|
|Manager|SMTP Server|587|TLS protection recommended|
|Manager|cldsrv.ensilo.com:443 / rbq.cldsrv.ensilo.com:443|443|Data sent to FCS|

# System Requirements

|Component|Memory|Disk Space|Processor|
|---|---|---|---|
|Collector|60 MB|20 MB|Intel or AMD x86 (32 or 64-bit)|
|Core|8 GB|80 GB|Intel or AMD x86 64-bit, 2 CPUs to service 5k collectors|
|Aggregator|16 GB|80 GB|Intel or AMD x86 64-bit, Minimum 2 CPUs|
|Central Manager|16 GB|150 GB|Intel or AMD x86 64-bit, Minimum 2 CPUs|
|Threat Hunting Repository|24GB to service 4k collectors and store 1 month data|1.5 TB to service 4k collectors and store 1 month data|16 CPUs|

# Supported Operating Systems

## FortiEDR Collector

### Windows
 - XP SP2/SP3
 - 7 SP1
 - 8
 - 8.1
 - 10
 - 11

### MacOS
 - El Capitan (10.11)
 - Sierra (10.12)
 - High Sierra (10.13)
 - Mojave (10.14)
 - Catalina (10.15)
 - Big Sur (11)
 - Monterey (12)

### Linux
 - RedHat Enterprise Linux (RHEL)
 - CentOS 6.8+/7.2+/8+
 - Ubuntu LTS 16.04.5+
 - Ubuntu 18.04 and 20.04 Server (64-bit only)
 - Oracle Linux 8.2+

### VDI Environments
 - VMWare Horizons 6 and 7
 - Citrix XenDesktop 7

## FortiEDR Core/Aggregator/Central Manager
 - ISO Format including a CentOS 7 image

# FortiEDR Configuration
 - You have the option to install manager, aggregator, core or both (manager/aggregator) onto one machine as long as you meet minimum requirements for FortiEDR components.

# FortiEDR Configuration (In the Real World (TM))
 - Separating Core, Manager, and aggregator appliances is the best option to create a modular deployment.
 - It is recommended to have 2 cores, 2 Managers, and 2 aggregators to provide redundancy in your FortiEDR deployment
  - However, since not all organizations can accomodate separate and redundant appliances a reasonable compromise:
    - 2 cores, 2 combined managers/aggregators.
      - Why?
        - 2 cores means that even during downtime you can still make policy changes that will replicate. In a breach scenario where FortiEDR has failed AND you have logs, as long as your cores are segmented you can create policies on the core that is still standing and have subsequent events be blocked.
        - This also means there is no lack of visbility or delay in response during maintenance procedures.
          - This implied redundancy also applies to managers/aggregators.


# Installing the Collector

## Information Required
 - IP Address of aggregator
 - Registration password: a secret password <b>common to all</b> FortiEDR collectors in a network or organization.
  - The Registration password is used to restrict collector installation and uninstallation.

## Windows
 - MSI Installer
 - Create a silent installer pre-scripted with registration password, aggregator IP address, and <b>optionally</b> an organization (multi-tenancy only) and collector group assignment.
  - Distribute through GPO or SCCM or preferred configuration management tool.

## Mac
 - DMG installer
 - May be distributed with a JSON file configured with the desired settings


## Linux
 - RHEL and CentOS: RPM installer
 - Ubuntu: DEB installer
 - Run fortiedrconfig.sh to configure

# Enhanced End-User Notification
 - Starting with <b>Version 5</b> there is a user tray notification that contains a list of events blocked by the FortiEDR collector.

# Scaling
 - Collectors connect to the closest available Core
  - Based on time to travel to core
  - Collectors connect to one core at a time
  - Up to 11 cores may be configured per aggregator

## Aggregator location
 - For small installations, the aggregator and management server may be hosted on a single machine
 - If you have more than 5,000 collectors, the aggregator should be moved to a separate machine
 - Each aggregator can hold up to 10,000 collectors

## Central Management Server Capacity
 - Each Central Manager can support up to 100,000 collectors

# Enterprise FortiEDR Deployment
 - Cores are typically placed on a site-by-site basis and communicate out to the central managers and by extension Threat Hunting Repositories.

