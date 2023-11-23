FROM centos:7.8.2003

RUN yum -y makecache \
    && yum install -y createrepo \
    && yum install -y yum-utils \
    && yum install -y epel-release \
    && yum install -y https://download.postgresql.org/pub/repos/yum/reporpms/EL-7-x86_64/pgdg-redhat-repo-latest.noarch.rpm \
    && sed -i 's/gpgcheck=1/gpgcheck=0/g' /etc/yum.repos.d/pgdg-redhat-all.repo \
    && sed -i 's/repo_gpgcheck = 1/repo_gpgcheck = 0/g' /etc/yum.repos.d/pgdg-redhat-all.repo \
    && yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo \
    && yum -y makecache

VOLUME /repos

COPY entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
