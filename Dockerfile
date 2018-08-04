FROM openjdk:8-jdk AS build

WORKDIR /opt/spigot

ADD https://hub.spigotmc.org/jenkins/job/BuildTools/lastStableBuild/artifact/target/BuildTools.jar /opt/spigot/BuildTools.jar

ARG version=latest
ENV MINECRAFT_VERSION ${version}

RUN java -jar BuildTools.jar --rev ${version} && \
    mv spigot-*.jar spigot.jar


##################################################################

FROM openjdk:10-jre

MAINTAINER Simon Marti <simon@marti.email>
WORKDIR /opt/spigot

COPY --from=build /opt/spigot/spigot.jar /var/lib/spigot/spigot.jar
