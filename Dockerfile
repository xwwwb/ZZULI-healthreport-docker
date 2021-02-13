FROM ubuntu
COPY chromev88.deb /root
COPY chromedriver /bin
COPY run.py /root
COPY Services.py /root
COPY sources.list /etc/apt/
RUN cd /root && dpkg -i chromev88.deb ; exit 0
RUN apt update
RUN DEBIAN_FRONTEND=noninteractive apt --fix-broken install -y
RUN apt install python3 python3-pip -y && pip3 install selenium requests
RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
RUN dpkg-reconfigure -f noninteractive tzdata
CMD python3 /root/run.py