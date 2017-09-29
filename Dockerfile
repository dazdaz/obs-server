# This Dockerfile is used to build an headles vnc image based on Ubuntu

FROM ubuntu:16.04

MAINTAINER potsky <potsky@me.com>

LABEL io.k8s.description="Headless OBS Container with VNC, XFCE Window Manager, Chromium, GIT" \
      io.k8s.display-name="Headless OBS Container based on Ubuntu 16"

ENV HOME=/root
ENV TERM=xterm
ENV STARTUPDIR=$HOME/startup
ENV INST_SCRIPTS=$HOME/install
ENV NO_VNC_HOME=$HOME/noVNC
ENV DEBIAN_FRONTEND=noninteractive
ENV VNC_COL_DEPTH=24
ENV VNC_RESOLUTION=1280x1024
ENV VNC_PW=vncpwd
ENV VNC_VIEW_ONLY=false
ENV DISPLAY=:1
ENV VNC_PORT=5901
ENV NO_VNC_PORT=6901
ENV SSH_PORT=22
ENV VERSION_GIT=2.14.1

# Open ports
EXPOSE $SSH_PORT $VNC_PORT $NO_VNC_PORT

### Envrionment config
WORKDIR $HOME

### Add install scripts
ADD ./install/ $INST_SCRIPTS/
RUN find $INST_SCRIPTS -name '*.sh' -exec chmod a+x {} +

### Install common tools
RUN $INST_SCRIPTS/tools.sh
ENV LANG='en_US.UTF-8' LANGUAGE='en_US:en' LC_ALL='en_US.UTF-8'

### Install xvnc-server & noVNC - HTML5 based VNC viewer
RUN $INST_SCRIPTS/tigervnc.sh
RUN $INST_SCRIPTS/no_vnc.sh
RUN $INST_SCRIPTS/chrome.sh
RUN $INST_SCRIPTS/xfce_ui.sh
RUN $INST_SCRIPTS/git.sh
RUN $INST_SCRIPTS/system.sh
RUN $INST_SCRIPTS/obs.sh

ADD ./runtime/xfce/ $HOME/
ADD ./runtime/system/vimrc /root/.vimrc
ADD ./runtime/system/motd /etc/motd

### configure startup
RUN $INST_SCRIPTS/libnss_wrapper.sh
ADD ./runtime/scripts $STARTUPDIR
RUN find $STARTUPDIR -name '*.sh' -exec chmod a+x {} +
###RUN $INST_SCRIPTS/set_user_permission.sh $STARTUPDIR $HOME

CMD [ "/root/startup/run.sh" ]