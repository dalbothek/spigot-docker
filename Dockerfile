FROM openjdk:8-jdk AS build

WORKDIR /opt/spigot

ADD https://hub.spigotmc.org/jenkins/job/BuildTools/lastStableBuild/artifact/target/BuildTools.jar /opt/spigot/BuildTools.jar

ARG version=latest

RUN java -Xmx1024M -jar BuildTools.jar --rev ${version} && \
    mv spigot-*.jar spigot.jar


##################################################################

FROM openjdk:10-jre

MAINTAINER Simon Marti <simon@marti.email>

WORKDIR /opt/spigot
VOLUME /opt/spigot

ENV SPIGOT_HOME=/opt/spigot \
    SPIGOT_JAR=/var/lib/spigot/spigot.jar \
    MIN_MEMORY=1G \
    MAX_MEMORY=1G \
    JAVA_OPTS=-XX:+UseConcMarkSweepGC

ENTRYPOINT ["/var/lib/spigot/docker-entrypoint.sh"]
COPY ["docker-entrypoint.sh", "/var/lib/spigot/docker-entrypoint.sh"]

ENV MINECRAFT_VERSION=${version}

COPY --from=build ["/opt/spigot/spigot.jar", "/var/lib/spigot/spigot.jar"]
