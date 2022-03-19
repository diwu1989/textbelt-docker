#!/bin/sh
sed -i "s|host: 'smtp.example.com'|host: process.env.HOST|" /textbelt/lib/config.js
sed -i "s|port: 587|port: parseInt(process.env.MAIL_PORT)|" /textbelt/lib/config.js
sed -i "s|user: 'user@example.com'|user: process.env.MAIL_USER|" /textbelt/lib/config.js
sed -i "s|pass: 'example password 1'|pass: process.env.MAIL_PASS|" /textbelt/lib/config.js
sed -i "s|secureConnection: 'false'|secureConnection: process.env.SECURE_CONNECTION|" /textbelt/lib/config.js
sed -i "s|'\"Jane Doe\"|process.env.REALNAME|" /textbelt/lib/config.js
sed -i "s|<jane.doe@example.com>|+ ' <' + process.env.FROM_ADDRESS + '>|" /textbelt/lib/config.js
sed -i "s|debugEnabled: false|debugEnabled: Boolean(process.env.MAIL_DEBUG)|" /textbelt/lib/config.js
exec node /textbelt/server/app.js
