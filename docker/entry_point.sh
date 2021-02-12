#!/usr/bin/env sh

nohup java \
-Dlog4j.configuration=file:/opt/ambry/config/log4j.properties \
-jar /opt/ambry/target/ambry.jar \
--serverPropsFilePath /opt/ambry/config/server.properties \
--hardwareLayoutFilePath /opt/ambry/config/HardwareLayout.json \
--partitionLayoutFilePath /opt/ambry/config/PartitionLayout.json \
&> /opt/ambry/target/logs/server.log &

cd /opt/ambry/target/ && exec nohup java \
-Dlog4j.configuration=file:/opt/ambry/config/log4j.properties \
-cp "*" com.github.ambry.frontend.AmbryFrontendMain \
--serverPropsFilePath /opt/ambry/config/frontend.properties \
--hardwareLayoutFilePath /opt/ambry/config/HardwareLayout.json \
--partitionLayoutFilePath /opt/ambry/config/PartitionLayout.json \
&> /opt/ambry/target/logs/frontend.log
