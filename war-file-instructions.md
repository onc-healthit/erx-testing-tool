# Instructions

This is a copy of the validation tool version 1.2.39. A WAR file is a Web Application Resource that contains libraries and files necessary to run the web application. The war files is deployed in a web application container.

This WAR file contains:

- backend logic
- frontend logic
- resource bundle (needs to be added to the war file as explained below)

This application needs the following infrastructure to execute the WAR file:

- web application server (e.g. tomcat)
  - the container runs the WAR file
- a database server (e.g. mysql)
  - the database server hosts 2 databases, the user account database and the erx database
  - optionaly the 2 databases can also be stored in 2 different database servers.
- a web server (optional)
  - this is used as a reverse proxy and shields the other components from the direct access.

## WAR file configuration

### Configure app-config.properties

For the application to run, the app-config.properties file needs to be updated to configure access to an SMTP server. The application uses emails to notify users and it won't run without it.

The file is located in the war file itself. Follow the commands below to update the file.

In a terminal:

go to the folder where the war file is located and type

```
jar xvf hit-base-tool-1.2.39.arc  WEB-INF/lib/hit-erx-tool-config-0.0.1-SNAPSHOT.jar
```

This will extract the library into the WEB-INF/lib folder that contains the file. Then type

```
cd WEB-INF/lib
jar xvf hit-erx-tool-config-0.0.1-SNAPSHOT.jar app-config.properties
```

This will extract the file to configure. In this file, edit the lines below and replace the `<ABC>` with your inputs.

```
mail.host=<SMTP_SERVER>
    This is the host of the SMTP server the application will connect to
mail.username=<SMTP_USERNAME>
    This is the username for the SMTP server
mail.password=<SMTP_PASSWORD>
    This is the password for the SMTP server

server.email=<SERVER_EMAIL>
    This is the validation tool email address. It will appear in the email from field
admin.emails=<ADMIN_EMAILS> comma delimited list (e.g. test@test.com,test1@test.com)
    This is the list of the user accounts that have admin priviledges 

app.privacy.link=<TOOL_URL>/docs/privacy.html
    This is the link to the privacy page
app.disclaimer.link=<TOOL_URL>/docs/disclaimer.html
    This is the link to the disclaimer page
app.baseUrl=<TOOL_URL>/erx
    This is the base url
app.transport.baseUrl=<TOOL_URL>/erx
    this is the base url for transport
```

Save the file then type

```
jar uvf hit-erx-tool-config-0.0.1-SNAPSHOT.jar app-config.properties
```

This will replace the library's file with the updated one. Then go back to the folder that has the war file and type

```
jar uvf hit-base-tool-1.2.39.arc  WEB-INF/lib/hit-erx-tool-config-0.0.1-SNAPSHOT.jar
```

This will replace the war file's library with the updated one.

The WEB-INF folder can then be deleted.

```
rm -rf WEB-INF
```

### Add the bundle and rebuild the war file

Go to the repository root folder and run the shell file

```
sh update-war-with-bundle.sh
```

This will create a dist folder and add the bundle file to the war file which will be in the dist file

## Infrastructure

In order for the web application from the WAR file to run, a minimuim of a servlet container and a database server will need to be installed and configured.
The application running in the NCPDP infrastructure is using the following:

- Tomcat as web application server
- mysql server for the erx application database
- mysql server for the user acount database (Note: the 2 databases can run in the same database server if needed)
- nginx for the web server
