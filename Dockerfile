FROM --platform=linux/amd64 ubuntu:22.04

RUN apt-get update && \
    apt-get install -y dash wget && \
    apt-get install -y net-tools && \
    apt-get install -y libnss3-tools && \
    apt-get install -y libtinfo5 && \
    apt-get install -y libncurses5 && \
    apt-get install -y libaio1

RUN ln -sf /bin/dash /bin/sh

RUN  wget -O /opt/openclinic.ubuntu.tar.gz https://bit.ly/ocubuntu

RUN tar zxf /opt/openclinic.ubuntu.tar.gz -C /opt

RUN rm /opt/openclinic.ubuntu.tar.gz

RUN groupadd mysql && \
    useradd -g mysql mysql && \
    chown -R mysql:mysql /opt/openclinic/mysql5

ENV LANGUAGE=EN
ENV COUNTRY=EN

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 10088

CMD ["/entrypoint.sh"]
