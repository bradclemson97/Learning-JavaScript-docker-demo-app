FROM node:13-alpine
# our own image is based on a node image from docker hub
# any linux commands can be used

ENV MONGO_DB_USERNAME=admin \
    MONGO_DB_PWD=password

# RUN - run any command which will apply to the container envrionment, this creates the following 'app' folder
RUN mkdir -p /home/app

# COPY - this executes commands on the HOST machine, this copies current folder files to home/app
COPY ./app /home/app

# set default dir so that next commands executes in /home/app dir
WORKDIR /home/app

# will execute npm install in /home/app because of WORKDIR
RUN npm install

# CMD is an entry point command, no need for /home/app/server.js because of WORKDIR, this starts the app with: 'node server.js'
CMD ["node", "server.js"]

