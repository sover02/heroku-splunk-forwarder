#!/bin/bash
printf "[user_info]\nUSERNAME = admin\nPASSWORD = $SPLUNK_PASSWORD" > /opt/splunk/etc/system/local/user-seed.conf
/opt/splunk/bin/splunk status --accept-license
/opt/splunk/bin/splunk set deploy-poll $SPLUNK_DEPLOY_SERVER:8089 -auth admin:$SPLUNK_PASSWORD
printf "\n\n[deployment-client]\n\nclientName = container-$(hostname)\n" >> /opt/splunk/etc/system/local/deploymentclient.conf
printf "\n\n[default]\n\nhost = container-$(hostname)\n" >> /opt/splunk/etc/system/local/inputs.conf
/opt/splunk/bin/splunk enable listen $PORT -auth admin:$SPLUNK_PASSWORD
/opt/splunk/bin/splunk start
/opt/splunk/bin/splunk edit licenser-groups Forwarder -is_active 1 -auth admin:$SPLUNK_PASSWORD
tail -f /opt/splunk/var/log/splunk/splunkd.log
