FROM anapsix/alpine-java:8_jdk
RUN apk add --update alpine-sdk
RUN MAVEN_VERSION=3.3.3 \
 && cd /usr/share \
 && wget http://archive.apache.org/dist/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz -O - | tar xzf - \
 && mv /usr/share/apache-maven-$MAVEN_VERSION /usr/share/maven \
 && ln -s /usr/share/maven/bin/mvn /usr/bin/mvn
ENV MAVEN_HOME /usr/share/maven
RUN apk add apache-ant
RUN apk update \
  && apk add ca-certificates curl \
  && curl --silent \
    --location https://github.com/sgerrand/alpine-pkg-R/releases/download/v3.2.3-r0/R-3.2.3-r0.apk --output /var/cache/apk/R-3.2.3-r0.apk \
    --location https://github.com/sgerrand/alpine-pkg-R/releases/download/v3.2.3-r0/R-dev-3.2.3-r0.apk --output /var/cache/apk/R-dev-3.2.3-r0.apk \
    --location https://github.com/sgerrand/alpine-pkg-R/releases/download/v3.2.3-r0/R-doc-3.2.3-r0.apk --output /var/cache/apk/R-doc-3.2.3-r0.apk \
  && apk add --allow-untrusted \
    /var/cache/apk/R-3.2.3-r0.apk \
    /var/cache/apk/R-dev-3.2.3-r0.apk \
    /var/cache/apk/R-doc-3.2.3-r0.apk \
  && rm -fr /var/cache/apk/*
RUN git clone https://github.com/yijunyu/demo-riskexplore /demo
ADD .m2 /demo/.m2
