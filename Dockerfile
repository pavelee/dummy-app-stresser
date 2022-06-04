FROM python:3.10-alpine3.15

RUN pip3 install robotframework

ENTRYPOINT [ "tail", "-f", "/dev/null" ]