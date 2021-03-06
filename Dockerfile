FROM node:10.15.1-alpine

ENV SERVICE_USER=app
ENV APP_DIR=/home/$SERVICE_USER/react-material-ui-ssr-sample

RUN adduser -D -g '' $SERVICE_USER
ADD --chown=app:app . $APP_DIR

WORKDIR $APP_DIR
RUN npm install
RUN npm run build

USER $SERVICE_USER
EXPOSE 3000

CMD ["npm", "run", "start"]
