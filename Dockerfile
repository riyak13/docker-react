FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
#no need for volume cos not changing code anymore
RUN npm run build

FROM nginx  
COPY --from=builder /app/build /usr/share/nginx/html

