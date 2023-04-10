#!/bin/bash
WEBSITE="https://www.targetwebsite.com/"

echo Escaneando host ${WEBSITE}
mkdir wrk/ 
zap-full-scan.py -t ${WEBSITE} -r ./report.html

SMTP_HOST="email-smtp.{region}.amazonaws.com"
SMTP_PORT="587"
SMTP_USER=""
SMTP_PASS=""
EMAIL_FROM=""
EMAIL_TO=""
NOW=$(date +'%d/%m/%Y')
SUBJECT="Title of the e-mail"

## Sending email
 
cat /zap/wrk/report.html | sendemail -l /tmp/email.log \
    -f ${EMAIL_FROM} \
    -u ${SUBJECT} \
    -t ${EMAIL_TO}  \
    -s ${SMTP_HOST}:${SMTP_PORT}  \
    -o tls=yes  \
    -xu ${SMTP_USER}  \
    -xp ${SMTP_PASS}