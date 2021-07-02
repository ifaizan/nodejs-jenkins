FROM node:14

WORKDIR /install/

COPY --chown=node:node package*.json /install/

RUN npm install && npm install pm2 -g

ENV NODE_PATH=/install/node_modules

WORKDIR /var/www/node/

COPY --chown=node:node  . .

#CMD ["node", "index.js"]

RUN chown -R node:node /var/www/node/ /install/

EXPOSE 3000

USER node

CMD ["pm2-runtime", "index.js"]
