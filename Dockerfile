FROM shervinkh/my-archlinux
MAINTAINER "Shervin Khastoo" <shervinkh145@gmail.com>
RUN /update.sh && \
    pacman -S --noconfirm sqlite python2 python2-flask && \
    git clone https://github.com/GulsahKose/cesi /app && \
    mkdir /data && \
    /cleanup.sh
COPY configs /etc/
COPY scripts /scripts/
EXPOSE 5000 9001

