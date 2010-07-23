sqlcmd -S .\SQLEXPRESS -Q "create database Training"
sqlcmd -S .\SQLEXPRESS -b -d Training -i Schema.sql
