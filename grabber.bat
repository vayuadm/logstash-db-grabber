@echo off

set JDBC_ORACLE_DRIVER=C:\dev\OracleClient\instantclient_12_1\ojdbc7.jar
set JDBC_USER=%1
set JDBC_PASSWORD=%2
set JDBC_CONNECTION_STRING=jdbc:oracle:thin:@mydph0399.hpeswlab.net:1521/almcost1210

bin\logstash -f alm_oracle_req.conf