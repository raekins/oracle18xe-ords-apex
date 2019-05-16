#!/bin/bash
source ~/.bash_profile
echo -e "Unlock HR schema" `date`

sqlplus -s / as sysdba << EOF
ALTER SESSION SET CONTAINER=XEPDB1;
PROMPT Unlock HR schema;
ALTER USER hr IDENTIFIED BY hr ACCOUNT UNLOCK;
exit
EOF

exit
