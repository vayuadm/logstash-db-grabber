# logstash-db-grabber


## Prerequisites
Install [logstash 5.x](https://www.elastic.co/downloads/logstash), place grabber.bat and the relavant logstash config file in logstash base folder.

## Run grabber
Edit query file with the desired SQL/Oracle statement.

Edit grabber.bat with your JDBC settings.

run grabber.bat and pass JDBC password as command line argument.
For example:
```shell
grabber MY_PASSWORD
```
