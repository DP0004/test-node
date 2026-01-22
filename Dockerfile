#use node image as our base image
FROM node

RUN mkdir /usr/src/app
#Goes to the app directory (think of it like a cd terminal command)
WORKDIR /usr/src/app


ENV PATH /usr/src/app/node_modules/.bin:$PATH
#Copy package,json and package-lock.json (if available)
COPY package*.json /usr/src/app/

#install all app dependencies
RUN npm install

#copy the rest of our app into the container
COPY . /usr/src/app/

# exposing to port of our system
EXPOSE 4000

#container uses CMD [] to start the app 
CMD [ "npm","start" ]
