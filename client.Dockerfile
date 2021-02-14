FROM node:14-buster

RUN apt-get update -qq
RUN npm install -g ember-cli

WORKDIR /client

# COPY client/package.json /client/package.json
# COPY ./client /client
# RUN yarn install

EXPOSE 3000

# Start the main process.
CMD ["yarn", "start"]