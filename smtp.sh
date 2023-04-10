#!/bin/bash
 
## SMTP configuration details
 
SMTP_HOST="email-smtp.{region}.amazonaws.com"
SMTP_PORT="587"
SMTP_USER=""
SMTP_PASS=""
EMAIL_FROM=""
EMAIL_TO=""
 
SUBJECT="Email Test"
 
## Sending email
 
cat file.txt | sendemail -l /tmp/email.log \
    -f ${EMAIL_FROM} \
    -u ${SUBJECT} \
    -t ${EMAIL_TO}  \
    -s ${SMTP_HOST}:${SMTP_PORT}  \
    -o tls=yes  \
    -xu ${SMTP_USER}  \
    -xp ${SMTP_PASS}