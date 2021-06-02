FROM archlinux
LABEL maintainer="Gwyneth Stark"

# setting environment variable for yay version
ENV yay_version 10.2.2-4

# adding supervisor config file
ADD build/*.conf /etc/supervisor.conf

# adding install script
ADD build/*.sh /root/

RUN pacman -Q glibc

# installation
RUN chmod +x /root/*.sh && /bin/bash /root/install.sh

ENV HOME /home/nobody
ENV LANG en_GB.UTF-8

CMD ["/usr/bin/bash"]