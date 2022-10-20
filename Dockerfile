FROM node:alpine

WORKDIR /app
RUN apk add --no-cache nfs-utils rpcbind
RUN npm install -g npm@7.22.0
COPY package.json .
RUN npm install --force
COPY . .
RUN npm install -g typescript
RUN tsc
EXPOSE 3001
#CMD ["npm", "run", "start:dock"]
CMD ["npm", "run", "start:debug"]
#CMD ["npm", "start"]
