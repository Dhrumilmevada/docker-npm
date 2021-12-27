FROM node:16-alpine

WORKDIR /app

COPY package.json .
RUN npm install

COPY  src /app/src
COPY  public /app/public

RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html