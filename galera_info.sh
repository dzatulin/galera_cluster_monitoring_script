#!/bin/sh
# galera_info.sh - galera cluster info

red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`
#===========================System
#Centos Version
sys_ver=`cat /etc/centos-release | awk '{ print $1,$2,$3 }'`
#Mariadb Version
db_ver=`mysql -e status | grep "^Server version" | awk '{print $3}'`
#Mariadb Uptime
db_uptime=`mysql -e STATUS | grep "^Uptime" | awk '{$1=""; print}'`
#Galera Driver Version
galera_drv_ver=`mysql --skip-column-names -B  -e "SHOW GLOBAL STATUS LIKE 'wsrep_provider_version'" | awk '{$1=""; print}'`

#===========================Status
#Status Galera Cluster
cluster_status=`mysql --skip-column-names -B  -e "SHOW GLOBAL STATUS LIKE 'wsrep_cluster_status'" | awk '{$1=""; print}'`
#Galera Cluster Size
cluster_size=`mysql --skip-column-names -B  -e "SHOW GLOBAL STATUS LIKE 'wsrep_cluster_size'" | awk '{$1=""; print}'`
#Galera State
cluster_local_state=`mysql --skip-column-names -B  -e "SHOW GLOBAL STATUS LIKE 'wsrep_local_state_comment'" | awk '{$1=""; print}'`
#Wsrep Closter conf ID
cluster_conf_id=`mysql --skip-column-names -B  -e "show global STATUS LIKE 'wsrep_cluster_conf_id'" | awk '{$1=""; print}'`
#Wsrep Closter state UUID
cluster_state_uuid=`mysql --skip-column-names -B  -e "show global STATUS LIKE 'wsrep_cluster_state_uuid'" | awk '{$1=""; print}'`
#Wsrep Sst Method
sst_method=`mysql --skip-column-names -B  -e "show global variables like 'wsrep_sst_method'" | awk '{$1=""; print}'`
#Wsrep Ready
wsrep_ready=`mysql --skip-column-names -B  -e "SHOW GLOBAL STATUS LIKE 'wsrep_ready'" | awk '{$1=""; print}'`
#Wsrep Conected
wsrep_con=`mysql --skip-column-names -B  -e "SHOW GLOBAL STATUS LIKE 'wsrep_connected'" | awk '{$1=""; print}'`
#Wsrep Node Address
node_name=`mysql --skip-column-names -B  -e "show global variables like 'wsrep_node_name'" | awk '{$1=""; print}'`
#Wsrep Node Address
node_ip=`mysql --skip-column-names -B  -e "show global variables like 'wsrep_node_address'" | awk '{$1=""; print}'`

#==========================Replication Health
#Local recv queue avg
local_recv_queue_avg=`mysql --skip-column-names -B  -e "SHOW GLOBAL STATUS LIKE 'wsrep_local_recv_queue_avg'" | awk '{$1=""; print}'`
#Local send queue avg
local_send_queue_avg=`mysql --skip-column-names -B  -e "SHOW GLOBAL STATUS LIKE 'wsrep_local_send_queue_avg'" | awk '{$1=""; print}'`
#Flow control paused
flow_control_paused=`mysql --skip-column-names -B  -e "SHOW GLOBAL STATUS LIKE 'wsrep_flow_control_paused'" | awk '{$1=""; print}'`


#OUTPUT
echo "========${red}SYSTEM${reset}============="
echo "${red}CentOS  Version: ${green}$sys_ver${reset}"
echo "${red}Mariadb Version: ${green}$db_ver${reset}"
echo "${red}Galera driver ver.: ${green}$galera_drv_ver${reset}"
echo "${red}Mariadb  Uptime: ${green}$db_uptime${reset}"
echo "========${red}Cluster${reset}============="
echo "${red}Cluster Status: ${green}$cluster_status${reset}"
echo "${red}Cluster Nodes Size: ${green}$cluster_size${reset}"
echo "${red}Cluster State: ${green}$cluster_local_state${reset}"
echo "${red}Cluster Conf ID: ${green}$cluster_conf_id${reset}"
echo "${red}Cluster State UUID: ${green}$cluster_state_uuid${reset}"
echo "${red}WSREP Method: ${green}$sst_method${reset}"
echo "${red}WSREP Ready: ${green}$wsrep_ready${reset}"
echo "${red}WSREP Connected: ${green}$wsrep_con${reset}"
echo "${red}Node Name: ${green}$node_name${reset}"
echo "${red}Node IP address: ${green}$node_ip${reset}"
echo "=====${red}Replication Health${reset}======"
echo "${red}Local recv queue avg: ${green}$local_recv_queue_avg${reset}"
echo "${red}Local send queue avg: ${green}$local_send_queue_avg${reset}"
echo "${red}Flow control paused: ${green}$flow_control_paused${reset}"