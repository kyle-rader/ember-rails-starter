FROM node:12.20-stretch

RUN apt-get update -qq

WORKDIR /client
COPY client/package.json /client/package.json
RUN yarn install
COPY ./client /client

EXPOSE 3000

# Start the main process.
CMD ["yarn", "start"]