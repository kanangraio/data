# Schema Naming Standards

- Database/Schema names are in lowercase
- column names are in lowercase
- an underscore '_' is used as a word separator

For each schema there is a sub-directory for raw `data`.
There is a sub-directory for each RDBMS implementation.
Each directory should contain the following files. There may be some differences depending on RDBMS.

- 00-user.sql
- 01-schema.sql
- 02-tables.sql
- 03-load.sql
- 04-data.sql
- 05-grant.sql
