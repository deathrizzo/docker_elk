FROM centos:7
RUN yum -y install epel-release; yum clean all;  
RUN yum -y install python-pip java telnet vim; yum clean all;
RUN pip install awscli --upgrade --user; 
RUN set enforce 0
ADD elasticsearch.repo /etc/yum.repos.d/elasticsearch.repo
RUN rpm --import https://artifacts.elastic.co/GPG-KEY-elasticsearch
RUN yum -y install elasticsearch logstash kibana
EXPOSE 9200 9300 5601 5044
CMD ["systemctl enable elasticsearch.service"]
