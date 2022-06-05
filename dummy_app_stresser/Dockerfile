FROM debian:bullseye-slim

# Setup X Window Virtual Framebuffer
ENV SCREEN_COLOUR_DEPTH 24
ENV SCREEN_HEIGHT 1080
ENV SCREEN_WIDTH 1920

RUN apt-get update \
    && apt-get install -y locales build-essential libssl-dev libffi-dev python3-dev \
    python3-pip python3-dev gcc libasound2 \
    python3-gi gobject-introspection gir1.2-gtk-3.0 \
    xvfb zip wget ca-certificates ntpdate \
    libnss3-dev libxss1 gconf-service libgconf-2-4 libpango1.0-0 xdg-utils fonts-liberation nodejs npm samba-client sshpass

# Install Robot Framework and Selenium Library
RUN python3 -m pip install --upgrade pip \ 
    && pip3 install \
    --ignore-installed \
    --no-cache-dir \
    robotframework \
    robotframework-browser;

RUN rfbrowser init

COPY entrypoint.sh /bin/entrypoint.sh
RUN chmod -R +x /bin/entrypoint.sh

COPY dummy_app_stresser.robot /srv/dummy_app_stresser.robot

ENV ROBOT_PATH=/srv/dummy_app_stresser.robot
ENV ROBOT_OPTIONS="-v page:http://wp.pl"

CMD ["entrypoint.sh"]