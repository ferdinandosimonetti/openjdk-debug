FROM openjdk:8-jre-slim

ENV ORACLE_HOME=/opt/oracle/instantclient_19_3
COPY oracle.conf /etc/ld.so.conf.d/
COPY nps-ca.pem /opt/workdir/
COPY SSLPoke.class /
RUN \
    cd $JAVA_HOME/lib/security \
    && keytool -keystore cacerts -storepass changeit -noprompt -trustcacerts -importcert -alias "npsCA" -file /opt/workdir/nps-ca.pem
ENTRYPOINT ["/bin/sh"]