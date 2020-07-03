FROM tomcat:9

MAINTAINER github.com/PengBAI

RUN rm -rf /usr/local/tomcat/webapps/ROOT/*

ADD webapp/ /usr/local/tomcat/webapps/ROOT/

# ADD https://secure.eicar.org/eicar.com /eicar.com

RUN git clone --depth=1 https://github.com/nVisium/MoneyX.git /home

## Create non-root user 
RUN useradd -ms /bin/bash mario \
    && usermod -aG mario mario \
    && chown -R mario:mario /usr/local/tomcat

EXPOSE 8080
CMD ["catalina.sh", "run"]

USER mario