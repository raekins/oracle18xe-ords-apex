#!/bin/bash
source ~/.bash_profile
echo -e "Install APEX" `date`

cd $APEX_HOME 
sqlplus -s / as sysdba << EOF
alter session set container=XEPDB1;
PROMPT Install APEX;
@configure_apex.sql
alter session set container=cdb$root;
alter user ANONYMOUS identified by anonymous;
alter user ANONYMOUS account unlock;
exit
EOF

exit
