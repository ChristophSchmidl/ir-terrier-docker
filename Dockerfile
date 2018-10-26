FROM ubuntu:18.04

ENV DEBIAN_FRONTEND noninteractive
ENV JAVA_HOME       /usr/lib/jvm/java-8-oracle
ENV LANG            en_US.UTF-8
ENV LC_ALL          en_US.UTF-8

RUN apt-get update && \
  apt-get install -y curl && \
  apt-get install -y --no-install-recommends apt-utils && \
  apt-get install software-properties-common -y && \ 
  apt-get install -y --no-install-recommends locales && \
  locale-gen en_US.UTF-8 && \
  apt-get dist-upgrade -y && \
  apt-get --purge remove openjdk* && \
  echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" | debconf-set-selections && \
  echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main" > /etc/apt/sources.list.d/webupd8team-java-trusty.list && \
  apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EEA14886 && \
  apt-get update && \
  apt-get install -y --no-install-recommends oracle-java8-installer oracle-java8-set-default maven

COPY ./terrier-core /terrier/terrier-core
COPY ./terrier-desktop /terrier/terrier-desktop

WORKDIR /terrier/terrier-core/

# See: http://terrier.org/docs/v5.0/terrier_develop.html
# Compile  
RUN mvn compile
# make the jar and jar-with-dependencies
#RUN mvn package
# as above, but skipping the JUnit tests
RUN mvn package -DskipTests

# Setup Terrier for using a TREC test collection by calling
RUN ./bin/trec_setup.sh share/vaswani_npl/corpus/doc-text.trec
# Indexing the collection
RUN ./bin/terrier batchindexing


