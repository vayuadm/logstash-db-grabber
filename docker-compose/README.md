# ELK with X-PACK disabled - Docker

## Description

This project creates a docker cluster with ELK services based on [Elasticsearch 5.2.2](https://github.com/elastic/elasticsearch-docker), [Logstash 5.2.2](https://github.com/elastic/logstash-docker) & [Kibana 5.2.2](https://github.com/elastic/kibana-docker) official docker images.
<BR>This project is bundled with Oracle's JDBC7 driver to enable Logstash connectibity to an Oracle DB.
<BR>[X-PACK](https://www.elastic.co/guide/en/x-pack/current/xpack-introduction.html) is disabled in all services.

Use this project to get up & running with data visualization! 

**NOTE: This project was tested on Ubuntu 16**

## Prerequisites

1. Follow [these instructions](https://docs.docker.com/compose/install/) to install docker-compose

## Project's structure

```
├── .env                                      # Holds environment configuration for ELK
├── ceribro.config                            # Holds configurations for Logstash (DB connection string, user, password, query file)
├── docker-compose.yml                        # Describes the ELK cluster
├── es
│   └── entrypoint.sh                         # Script for removing X-PACK & running Elasticsearch
├── kibana
│   └── entrypoint.sh                         # Script for removing X-PACK & running Kibana
├── ls
│   ├── drivers                               
│   │   └── ojdbc7.jar                        # JDBC driver for Oracle DB
│   ├── entrypoint.sh                         # Script for removing X-PACK & running Logstash
│   ├── pipelines                             # All pipelines in this folder will be executed by Logstash
│   │   └── alm_oracle_req.conf               # A generic pipeline for fetching data from a DB & indexing it into Elasticsearch
│   └── queries                               # Holds query files that can be injected into the generic pipeline
└── start.sh                                  # Runs the project & loads the configurations from 'ceribro.config'
```

## Usage

1. Clone this repo
2. Create a query file under ```ls/queries```, here you should describe the query for getting the desired data from your DB
3. Create the file ```ceribro.config``` & fill the required info (DB Connection string, DB User, DB Password, Query file for Logstash)
```ini
DNS_RESOLVER_IP=127.0.0.1                                               # DNS server for resolving host-names

LS_CONNECTION_STRING=jdbc:oracle:thin:@[ORACLE-SERVER]:[PORT]/[SID]     # DB connection string
LS_DB_USER=[USER]
LS_DB_PASSWORD=[PASSWORD]

LS_DB_QUERY_STRING_FILE=[QUERY_FILE_NAME]                              # Loaded dynamically to the generic pipeline
```
4. Run the startup script ```start.sh```, the cluster will be created & Logstash will start indexing data into Elasticsearch
5. Browse ```http://localhost:9200``` to look-into Elasticsearch
6. Start using Kibana via this URL ```http://localhost:5601```

**NOTE: You can create a new pipeline file in ```ls/pipelines``` & it will be executed by Logstash** 

## Common issues

**Q:** My Database is not reachable!<BR>
**A:** Please make sure you're able to ping your DB server from your machine.

**Q:** The DB server is reachable from my machine & Logstash is still unable to reach it!!<BR>
**A:** If you use the machine's name & not its IP you need to fill your DNS resolver's IP in ```ceribro.config```
