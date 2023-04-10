FROM owasp/zap2docker-weekly
USER root
RUN apt update; apt install sendemail; \
apt install libio-socket-ssl-perl -y
COPY ./entrypoint.sh entrypoint.sh
ENTRYPOINT [ "./entrypoint.sh" ]