FROM --platform=linux/amd64 ubuntu:22.04

RUN apt-get update && apt-get install -y dash && ln -sf /bin/dash /bin/sh

RUN apt-get install -y curl && \
    curl -L https://bit.ly/ocubuntu -o /opt/openclinic.ubuntu.tar.gz && \
    cd /opt && \
    tar zxf /opt/openclinic.ubuntu.tar.gz && \
    rm /opt/openclinic.ubuntu.tar.gz

RUN apt-get update && \
    groupadd mysql && \
    useradd -g mysql mysql && \
    apt-get install -y net-tools && \
    dpkg -i /opt/openclinic/libtinfo5_6.4-2_amd64.deb && \
    dpkg -i /opt/openclinic/libncurses5_6.4-2_amd64.deb && \
    dpkg -i /opt/openclinic/libaio1_0.3.113-4_amd64.deb && \
    apt-get install -y libnss3-tools && \
    chown -R mysql:mysql /opt/openclinic/mysql5

ENV LANGUAGE=EN
ENV COUNTRY=EN

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 10088

CMD ["/entrypoint.sh"]
