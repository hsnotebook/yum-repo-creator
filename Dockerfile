FROM centos:7.8.2003

RUN yum makecache
RUN yum install -y createrepo

# postgresql repo
RUN yum install -y https://download.postgresql.org/pub/repos/yum/reporpms/EL-7-x86_64/pgdg-redhat-repo-latest.noarch.rpm
RUN yum -y makecache

# docker repo
RUN yum install -y yum-utils && \
    yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
RUN yum -y makecache

# epel
RUN yum install -y epel-release
RUN yum -y makecache

VOLUME /repos

COPY entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
