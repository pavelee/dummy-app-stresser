FROM docker:20.10.8-dind-alpine3.13

COPY --from=library/docker:latest /usr/local/bin/docker /usr/bin/docker

COPY ./docker-entrypoint.sh /usr/local/bin/docker-entrypoint
RUN chmod +x /usr/local/bin/docker-entrypoint

COPY ./dummy_app_stresser /srv/dummy_app_stresser

CMD ["dockerd-entrypoint.sh"]

ENTRYPOINT ["docker-entrypoint"]