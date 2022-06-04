FROM python:3.10-alpine3.15

RUN pip3 install robotframework robotframework-requests

COPY dummy_app_stresser.robot /srv/dummy_app_stresser.robot
COPY entrypoint.sh /srv/entrypoint.sh
RUN chmod +x /srv/entrypoint.sh

ENV ROBOT_PATH=/srv/dummy_app_stresser.robot
ENV ROBOT_OPTIONS="-v page:http://wp.pl"

CMD ["/srv/entrypoint.sh"]