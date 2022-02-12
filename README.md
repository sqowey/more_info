# More informations for Sqowey
This repository holds very much additional info for an Chatservice called [Sqowey](https://www.github.com/sqowey/sqowey)

# Databases

If you want to create the databases fast, you can use the sql-files in the directory `sql_files`.  
There are two databases.  
All databases and tables use utf8_general_ci.  

## Databases > Accounts
The first one is called `accounts` and is seperated from the other database, for following reasons:
- If you want to have a separated database-server you can host it anywhere other. 
- If you have more than one onlineservice, it's easier to connect all services to this one databse.
You can get even more information like the datatype, length and so on from the files in the directory `sql_files`.  
This database holds the following tables:

### Databases > Accounts > accounts
This table holds:
- Account ID 
- Username
- Password
- EMail
- Mobile phone number
- Avatar image path
- Account creation timestamp

### Databases > Accounts > settings  
This table holds:
- The user id
- Privacy_settings
- preffered user language
- online status
