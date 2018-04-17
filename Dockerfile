FROM node:8

RUN mkdir -p /home/app

COPY ./attach/* /home/app/
COPY ./node_modules /home/app/node_modules

WORKDIR /home/app

EXPOSE 8001
EXPOSE 9929

CMD ["node", "--inspect=0.0.0.0:9929","app.js"]
