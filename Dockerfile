# Python 2 is required
FROM jfloff/alpine-python:2.7-slim

# Get NPM & Yarn
RUN apk add npm
RUN npm install -g yarn

# Install the project
RUN mkdir /proj
WORKDIR /proj
COPY babel.config.js config-overrides.js .eslintrc.json .jest jest.config.js LICENSE package.json .prettierrc.json README.md .storybook yarn.lock /proj/
COPY ./src /proj/src
COPY ./docs /proj/docs
COPY ./wmlandscape /proj/wmlandscape
COPY ./public /proj/public

# Yarn install the dependencies
RUN yarn install

# It runs on 3000
EXPOSE 3000
ENTRYPOINT yarn start
