FROM debian:jessie

RUN dpkg --add-architecture i386
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y apt-utils wget vim htop
RUN apt-get install -y lib32stdc++6 libcurl4-gnutls-dev:i386

RUN useradd -m steam
USER steam
ENV HOME /home/steam
ENV STEAM_CMD /home/steam/steamcmd
ENV STEAM_APPS /home/steam/steamapps

WORKDIR ${HOME}
RUN mkdir steamcmd
RUN mkdir -p ~/.klei/DoNotStarveTogether/

WORKDIR ${STEAM_CMD}
RUN wget "http://media.steampowered.com/installer/steamcmd_linux.tar.gz"
RUN tar -zxf steamcmd_linux.tar.gz
RUN ./steamcmd.sh +@ShutdownOnFailedCommand 1 +@NoPromptForPassword 1 +login anonymous +force_install_dir /home/steam/steamapps/DST +app_update 343050 validate +quit

ADD settings.ini dedicated_server_mods_setup.lua modoverrides.lua worldgenoverride.lua ${HOME}/
ADD configure.sh change.slot.sh change.port.sh update.sh set.mods.sh override.world.sh ${STEAM_APPS}/DST/bin/

WORKDIR ${HOME}
RUN cp dedicated_server_mods_setup.lua ~/steamapps/DST/mods/
RUN cp settings.ini modoverrides.lua worldgenoverride.lua ~/.klei/DoNotStarveTogether/

WORKDIR ${STEAM_APPS}/DST/bin/
ENTRYPOINT ./dontstarve_dedicated_server_nullrenderer
