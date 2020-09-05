FROM node:12-alpine
WORKDIR /app
COPY ./to-do-app-nodejs .
RUN yarn install --production
CMD ["node", "/app/src/index.js"]
