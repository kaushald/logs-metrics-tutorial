# 1
FROM alpine:3.6

# 2
LABEL maintainer="kaushaldalvi@gmail.com"

# 3
ARG JMETER_VERSION="5.4.1"

# 4
ENV JMETER_HOME /opt/apache-jmeter-${JMETER_VERSION}
ENV JMETER_BIN  ${JMETER_HOME}/bin
ENV MIRROR_HOST http://mirrors.ocf.berkeley.edu/apache/jmeter
ENV JMETER_DOWNLOAD_URL ${MIRROR_HOST}/binaries/apache-jmeter-${JMETER_VERSION}.tgz
ENV JMETER_PLUGINS_DOWNLOAD_URL http://repo1.maven.org/maven2/kg/apc
ENV JMETER_PLUGINS_FOLDER ${JMETER_HOME}/lib/ext/

# 5
RUN    apk update \
	&& apk upgrade \
	&& apk add ca-certificates \
	&& update-ca-certificates \
            && apk add --update openjdk8-jre tzdata curl unzip bash \
            && cp /usr/share/zoneinfo/Europe/Rome /etc/localtime \
            && echo "America/New_York" >  /etc/timezone \
	&& rm -rf /var/cache/apk/* \
	&& mkdir -p /tmp/dependencies  \
	&& curl -L --silent ${JMETER_DOWNLOAD_URL} >  /tmp/dependencies/apache-jmeter-${JMETER_VERSION}.tgz  \
	&& mkdir -p /opt  \
	&& tar -xzf /tmp/dependencies/apache-jmeter-${JMETER_VERSION}.tgz -C /opt  \
	&& rm -rf /tmp/dependencies

# 6
RUN curl -L --silent ${JMETER_PLUGINS_DOWNLOAD_URL}/jmeter-plugins-dummy/0.2/jmeter-plugins-dummy-0.2.jar -o ${JMETER_PLUGINS_FOLDER}/jmeter-plugins-dummy-0.2.jar
RUN curl -L --silent ${JMETER_PLUGINS_DOWNLOAD_URL}/jmeter-plugins-cmn-jmeter/0.5/jmeter-plugins-cmn-jmeter-0.5.jar -o ${JMETER_PLUGINS_FOLDER}/jmeter-plugins-cmn-jmeter-0.5.jar
RUN curl -L --silent https://search.maven.org/remotecontent?filepath=com/github/johrstrom/jmeter-prometheus-plugin/0.6.0/jmeter-prometheus-plugin-0.6.0.jar -o ${JMETER_PLUGINS_FOLDER}/jmeter-prometheus-plugin-0.6.0.jar

# 7
ENV PATH $PATH:$JMETER_BIN

# 8
COPY launch.sh /

#9
WORKDIR ${JMETER_HOME}

#10
EXPOSE 9270

#11
ENTRYPOINT ["/launch.sh"]
