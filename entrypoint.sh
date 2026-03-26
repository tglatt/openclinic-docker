#!/bin/bash

cd /opt/openclinic && ./restart_openclinic

if [ ! -f /opt/openclinic/.configured ]; then
    
    sleep 5

    /opt/openclinic/mysql5/bin/mysql --defaults-file=/opt/openclinic/mysql5/my.cnf --execute="use ocadmin_dbo;update admin set language='$LANGUAGE';update userparameters set value='$LANGUAGE' where parameter='userlanguage'"

    /opt/openclinic/mysql5/bin/mysql --defaults-file=/opt/openclinic/mysql5/my.cnf --execute="use openclinic_dbo;delete from OC_CONFIG where oc_key='configureCountry';insert into OC_CONFIG(oc_key,oc_value) values('configureCountry','$COUNTRY');delete from oc_config where oc_key like '%global%';"

    touch /opt/openclinic/.configured
fi

tail -f /opt/openclinic/tomcat8/logs/catalina.out
