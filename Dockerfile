FROM node:lts-bullseye

RUN apt-get update && \
  apt-get install -y --no-install-recommends \
  ffmpeg \
  imagemagick \
  webp && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

COPY package.json .
COPY package-lock.json .

RUN npm install --legacy-peer-deps

COPY . .

CMD ["npm", "start"]