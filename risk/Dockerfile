FROM anapsix/alpine-java:8_jdk
RUN apk add --update alpine-sdk
RUN MAVEN_VERSION=3.3.3 \
 && cd /usr/share \
 && wget http://archive.apache.org/dist/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz -O - | tar xzf - \
 && mv /usr/share/apache-maven-$MAVEN_VERSION /usr/share/maven \
 && ln -s /usr/share/maven/bin/mvn /usr/bin/mvn
ENV MAVEN_HOME /usr/share/maven
RUN apk add apache-ant
RUN apk add R 
RUN git clone https://github.com/yijunyu/demo-riskexplore /demo
ADD .m2 /demo/.m2
