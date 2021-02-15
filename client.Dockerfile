FROM node:14-buster AS node-build

RUN apt-get update -qq

# Chrome install steps taken from https://hub.docker.com/r/browserless/chrome/dockerfile
RUN apt-get install -y \
    fonts-liberation \
    fontconfig \
    libappindicator3-1 \
    libasound2 \
    libatk1.0-0 \
    libgtk-3-0 \
    libnspr4 \
    libx11-6 \
    libx11-xcb1 \
    libxss1 \
    libxtst6 \
    libnss3 \
    libgbm1 \
    lsb-release \
    xdg-utils \
    wget \
    xvfb \
    curl &&\
    # Fonts
    fc-cache -f -v

RUN cd /tmp &&\
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb &&\
    dpkg -i google-chrome-stable_current_amd64.deb && rm -rf /tmp/*

RUN npm install -g ember-cli

WORKDIR /client

COPY ./client/package.json .
COPY ./client/yarn.lock .
RUN yarn install

# Now copy the rest
COPY ./client .

RUN ember build

CMD ["yarn", "start"]