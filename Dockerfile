from centos:centos7
RUN yum install -y wget \
   && wget -O splunk-7.2.4-8a94541dcfac-linux-2.6-x86_64.rpm 'https://www.splunk.com/bin/splunk/DownloadActivityServlet?architecture=x86_64&platform=linux&version=7.2.4&product=splunk&filename=splunk-7.2.4-8a94541dcfac-linux-2.6-x86_64.rpm&wget=true' \
   && yum install -y splunk-7.2.4-8a94541dcfac-linux-2.6-x86_64.rpm \
   && printf '\nOPTIMISTIC_ABOUT_FILE_LOCKING = 1' >> /opt/splunk/etc/splunk-launch.conf
COPY entrypoint.sh .
RUN chmod +x entrypoint.sh
CMD ["bash", "entrypoint.sh"]
