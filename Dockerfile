FROM alpine

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories \
    apk --no-cache --no-progress upgrade && \
    apk --no-cache --no-progress add samba && \
    file="/etc/samba/smb.conf" && \
    echo '[root]' >>$file && \
    echo '   comment = All Printers' >>$file && \
    echo '   browseable = yes' >>$file && \
    echo '   path = /mount' >>$file && \
    echo '   read only = no' >>$file && \
    echo '   valid users = root' >>$file && \
    mkdir -p /mount && \
    chmod 777 /mount && \
    rc-update add samba && \
    rc-service samba start