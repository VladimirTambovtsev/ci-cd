# create base image
FROM node:alpine as builder

WORKDIR '/app'

# install dependencies 
COPY package.json . 
RUN npm install
COPY . . 
RUN npm run build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html