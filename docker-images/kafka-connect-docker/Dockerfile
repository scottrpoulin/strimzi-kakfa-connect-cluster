FROM quay.io/strimzi/kafka:0.34.0-kafka-3.3.2
USER root:root
RUN microdnf install yum
RUN yum -y update
COPY ./plugins/ /opt/kafka/plugins/
RUN chmod 755 /opt/kafka/plugins && chmod 755 /opt/kafka/plugins/snowflake-connector

USER 1001