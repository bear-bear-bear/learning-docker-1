FROM node:16-alpine as builder

WORKDIR '/app'

COPY package.json .
RUN npm install

COPY . .

CMD ["npm", "run", "build"]

RUN echo 'time'

FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
