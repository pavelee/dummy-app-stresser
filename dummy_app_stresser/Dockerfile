FROM debian:bullseye-slim

RUN apt-get update \
    && apt-get install -y \ 
    python3-pip python3-dev \
    libasound2 libdbus-glib-1-2 \
    xvfb \
    nodejs npm \
    && apt-get clean autoclean \
    && apt-get autoremove --yes \
    && rm -rf /var/lib/{apt,dpkg,cache,log}/;

RUN pip3 install \
    robotframework \
    robotframework-browser;

RUN rfbrowser init

COPY entrypoint.sh /bin/entrypoint.sh
RUN chmod -R +x /bin/entrypoint.sh

COPY dummy_app_stresser.robot /srv/dummy_app_stresser.robot

ENV SCREEN_COLOUR_DEPTH 24
ENV SCREEN_HEIGHT 1080
ENV SCREEN_WIDTH 1920

ENV ROBOT_PATH=/srv/dummy_app_stresser.robot
ENV ROBOT_OPTIONS="-v page:http://wp.pl"

CMD ["entrypoint.sh"]