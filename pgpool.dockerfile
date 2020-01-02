FROM centos

ENV PGPOOL_PATH="/etc/pgpool-II"
ENV PGPOOLCONF_PATH="/etc/pgpool-II/pgpool.conf"
ENV PCPCONF_PATH="/etc/pcp.conf"

RUN yum install -y http://www.pgpool.net/yum/rpms/4.1/redhat/rhel-7-x86_64/pgpool-II-release-4.1-1.noarch.rpm
RUN yum install -y pgpool-II-pg94
RUN yum install -y pgpool-II-pg94-extensions

RUN chkconfig pgpool on
RUN systemctl enable pgpool.service
RUN mkdir /var/run/postgresql/
RUN mkdir /var/log/pgpool/
RUN pgpool -n -d > /tmp/pgpool.log 2>&1 &

# RUN tail -f /tmp/pgpool.log

#yum install -y nano
