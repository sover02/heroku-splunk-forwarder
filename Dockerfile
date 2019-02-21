from centos:centos7
RUN yum install -y wget
RUN wget -O splunk-7.2.4-8a94541dcfac-linux-2.6-x86_64.rpm 'https://www.splunk.com/bin/splunk/DownloadActivityServlet?architecture=x86_64&platform=linux&version=7.2.4&product=splunk&filename=splunk-7.2.4-8a94541dcfac-linux-2.6-x86_64.rpm&wget=true'
#COPY splunk-7.2.4-8a94541dcfac-linux-2.6-x86_64.rpm .
RUN yum install -y splunk-7.2.4-8a94541dcfac-linux-2.6-x86_64.rpm 
RUN printf '\nOPTIMISTIC_ABOUT_FILE_LOCKING = 1' >> /opt/splunk/etc/splunk-launch.conf
RUN printf '[user_info]\nUSERNAME = admin\nPASSWORD = changeme' > /opt/splunk/etc/system/local/user-seed.conf
RUN /opt/splunk/bin/splunk start --accept-license
RUN /opt/splunk/bin/splunk set deploy-poll splunk2.6davids.com:8089 -auth admin:changeme
RUN printf "\n\n[deployment-client]\n\nclientName = container-$(hostname)\n" >> /opt/splunk/etc/system/local/deploymentclient.conf
RUN /opt/splunk/bin/splunk enable listen 80 -auth admin:changeme
RUN /opt/splunk/bin/splunk add forward-server splunk2.6davids.com:9997 -auth admin:changeme
CMD ["/opt/splunk/bin/splunk", "restart"]
