#!/bin/bash
source ~/.bash_profile
echo -e "Configure ORDS" `date`

echo -e "Setup configuration directory"
cd  /u01/ords

$JAVA_HOME/bin/java -jar ords.war configdir /u01/ords/conf

$JAVA_HOME/bin/java -jar ords.war

$JAVA_HOME/bin/java -jar ords.war map-url --type base-path /xepdb1 xepdb1

exit
