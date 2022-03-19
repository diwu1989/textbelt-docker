FROM node:alpine

ENV COMMIT=599707d
WORKDIR /textbelt
RUN wget -O - https://github.com/diwu1989/textbelt/tarball/$COMMIT \
  | tar vxz --strip-components=1
RUN yarn && npm cache clean --force && yarn cache clean --all --force

COPY startup.sh /startup.sh
CMD sh /startup.sh

# variables for textbelt
ENV \
  PORT="9090" \
  HOST="imap.gmail.com" \
  MAIL_PORT="587" \
  MAIL_USER="email username" \
  MAIL_PASS="email password" \
  SECURE_CONNECTION="true" \
  FROM_ADDRESS="email@emailaddress.com" \
  REALNAME="yourname" \
  MAIL_DEBUG="true"

EXPOSE 9090
