FROM node:alpine

WORKDIR /app
RUN apk add --no-cache nfs-utils rpcbind
RUN npm install -g npm@8.15.0
COPY package.json .
RUN npm install
COPY . .
RUN npm install -g typescript
RUN tsc
EXPOSE 3001
#CMD ["npm", "run", "start:dock"]
CMD ["npm", "run", "start:debug"]
#CMD ["npm", "start"]
