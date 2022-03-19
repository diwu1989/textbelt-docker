FROM node:alpine

ENV \
#variables for textbelt
  PORT="9090" \
  HOST="imap.gmail.com" \
  MAIL_PORT="587" \
  MAIL_USER="email username" \
  MAIL_PASS="email password" \
  SECURE_CONNECTION="true" \
  FROM_ADDRESS="email@emailaddress.com" \
  REALNAME="yourname" \
  MAIL_DEBUG="true"

WORKDIR /textbelt
RUN wget -O - https://github.com/typpo/textbelt/tarball/fa533c889ea8320885047f6f71879cda23dfc098 \
  | tar xz --strip-components=1
RUN npm --prefix . install . && npm cache clean --force

COPY startup.sh /startup.sh
CMD sh /startup.sh

EXPOSE 9090
