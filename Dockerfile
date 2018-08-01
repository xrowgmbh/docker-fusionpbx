FROM centos/systemd

MAINTAINER "Björn Dieding" <bjoern@xrow.de>

RUN yum install -y centos-release-scl-rh && \
    INSTALL_PKGS="wget" && \
    yum install -y --setopt=tsflags=nodocs $INSTALL_PKGS && \
    rpm -V $INSTALL_PKGS && \
    yum clean all 

RUN wget -O - https://raw.githubusercontent.com/fusionpbx/fusionpbx-install.sh/master/centos/pre-install.sh | sh
RUN cd /usr/src/fusionpbx-install.sh/centos && ./install.sh

EXPOSE 80
EXPOSE 443
EXPOSE 5060/tcp
EXPOSE 5060/udp
EXPOSE 5061/tcp
EXPOSE 5061/udp
EXPOSE 5080/tcp
EXPOSE 5080/udp
EXPOSE 5081/tcp
EXPOSE 5081/udp

EXPOSE 16384-32768/udp

CMD ["/usr/sbin/init"]
