# galera_cluster_monitoring_script

### This script is needed to simplify the monitoring of the Galera Cluster

    > chmod +x galera_info.sh
    > ./galera_info.sh

Output:
```
========SYSTEM=============
CentOS  Version: CentOS release 6.10
Mariadb Version: 10.0.38-MariaDB-wsrep
Galera driver ver.:  25.3.25(r3836)
Mariadb  Uptime:  7 days 15 hours 26 min 43 sec
========Cluster=============
Cluster Status:  Primary
Cluster Nodes Size:  3
Cluster State:  Synced
Cluster Conf ID:  684
Cluster State UUID:  daeae671-9a80-11e6-9422-03040af75c57
WSREP Method:  xtrabackup-v2
WSREP Ready:  ON
WSREP Connected:  ON
Node Name:  mrdb1
Node IP address:  10.1.1.100
=====Replication Health======
Local recv queue avg:  0.111134
Local send queue avg:  0.006453
Flow control paused:  0.000011
```
update_2.10.2021

