FROM node:14-alpine

WORKDIR /app

# add '/app/node_modules/.bin' to $PATH
ENV PATH /app/node_modules/.bin:$PATH
# install application dependencies
COPY package*.json ./
RUN npm install
RUN npm install keycloak-js@23.0.4

RUN npm install primereact
RUN npm install primeflex
# RUN npm install react-scripts -g

# copy app files
COPY . .

EXPOSE 3000
CMD ["npm", "start"]