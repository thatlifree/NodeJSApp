FROM mhart/alpine-node:18 as development

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

RUN npm install

# Bundle app source
COPY . .

EXPOSE 8080
CMD [ "node", "server.js" ]

FROM mhart/alpine-node:18 as test
WORKDIR /usr/src/app
COPY --from=development /usr/src/app/ .
RUN ["npm", "run", "test"]


FROM mhart/alpine-node:18 as production

# Create app directory
WORKDIR /usr/src/app

COPY package*.json ./

RUN npm ci --only=production
# If you are building your code for production
# RUN npm ci --only=production

# Bundle app source
COPY . .

EXPOSE 8080
CMD [ "node", "server.js" ]