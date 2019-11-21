FROM ubuntu:18.04

ENV ORACLE_HOME=/opt/oracle/instantclient
ENV LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$ORACLE_HOME
ENV OCI_HOME=/opt/oracle/instantclient
ENV OCI_LIB_DIR=/opt/oracle/instantclient
ENV OCI_INCLUDE_DIR=/opt/oracle/instantclient/sdk/include

RUN apt-get update && \
  apt-get install -y --no-install-recommends software-properties-common && \
  add-apt-repository ppa:jonathonf/python-3.6 && \
  apt-get update -y  && \
  # remove temp files
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

COPY ./oracle-instantclient/ /opt/data
COPY ./install-instantclient.sh /opt/data

WORKDIR /opt/data

# install instant client
RUN ./install-instantclient.sh
