FROM oracle/graalvm-ce:19.0.0

RUN /usr/local/bin/gu install python \
 && /usr/local/bin/gu install R \
 && /usr/local/bin/gu install ruby

RUN curl -sL https://www-us.apache.org/dist/maven/maven-3/3.6.0/binaries/apache-maven-3.6.0-bin.tar.gz | /bin/tar xz -C /opt/ \
 && ln -s /opt/apache-maven-3.6.0 /opt/maven

ENV M2_HOME /opt/maven
ENV MAVEN_HOME /opt/maven
ENV JAVA_HOME /opt/graalvm-ce-19.0.0
ENV PATH ${JAVA_HOME}/bin:${M2_HOME}/bin:${PATH}

WORKDIR /project
VOLUME /project
CMD /bin/bash