FROM oracle/graalvm-ce:19.0.0

ENV MVN_VERSION 3.6.1
ENV M2_HOME /opt/maven
ENV MAVEN_HOME /opt/maven
ENV JAVA_HOME /opt/graalvm-ce-19.0.0
ENV GRAALVM_HOME ${JAVA_HOME}
ENV PATH ${JAVA_HOME}/bin:${M2_HOME}/bin:${PATH}

RUN ${GRAALVM_HOME}/bin/gu install python \
 && ${GRAALVM_HOME}/bin/gu install R \
 && ${GRAALVM_HOME}/bin/gu install ruby \
 && ${GRAALVM_HOME}/bin/gu install native-image

RUN curl -sL https://www-us.apache.org/dist/maven/maven-3/${MVN_VERSION}/binaries/apache-maven-${MVN_VERSION}-bin.tar.gz | /bin/tar xz -C /opt/ \
 && ln -s /opt/apache-maven-${MVN_VERSION} /opt/maven


WORKDIR /project
VOLUME /project
CMD /bin/bash
