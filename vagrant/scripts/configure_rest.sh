#!/bin/bash
source ~/.bash_profile
echo -e "Enable REST" `date`

sqlplus -s / as sysdba << EOF
ALTER SESSION SET CONTAINER=XEPDB1;
PROMPT Enable REST;
CONN hr/hr@XEPDB1;
@ords_hr.sql
exit
EOF

exit
