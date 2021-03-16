# NCPDP ePrescribing eRX Validation Tool Copy for the NCPDP SCRIPT Standard Version 2017071 and Version 10.6
This is a copy of the validation tool version 1.2.34. The repository contains the WAR file and instructions to configure the WAR file. Additional installations and configuration will be needed to integrate the WAR file into the infrastructure necessary for the WAR file to run.

**The copy of the validation tool is for internal testing only, is available at no cost, is not actively updated and does not qualify as an ONC-approved test tool for the purpose of certification testing.**

A WAR file is a Web Application Resource that contains libraries and files necessary to run the web application. The war files is deployed in a web application container.

This WAR file contains:

- backend logic
- frontend logic
- resource bundle

This application needs the following infrastructure to execute the WAR file:

- web application server (e.g. tomcat)
  - the container runs the WAR file
- a database server (e.g. mysql)
  - the database server hosts 2 databases, the user account database and the erx database
  - optionaly the 2 databases can also be stored in 2 different database servers.
- a web server (optional)
  - this is used as a reverse proxy and shields the other components from the direct access.
  
Here is the link where the WAR file can be downloaded from: [WAR download](https://github.com/onc-healthit/erx-testing-tool/blob/main/hit-base-tool-1.2.34.war)


Here is the link to the WAR instructions file: [WAR Instructions](https://github.com/onc-healthit/erx-testing-tool/blob/main/war-file-instructions.md)
