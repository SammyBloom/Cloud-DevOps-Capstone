FROM node:alpine as build

LABEL author="Samuel Nwanwobi"

# set the working direction
WORKDIR /app

# add `/app/node_modules/.bin` to $PATH
ENV PATH /app/node_modules/.bin:$PATH

# install app dependencies
COPY ./package.json /app/
RUN yarn --silent

COPY . /app

RUN yarn build

FROM nginx:alpine
COPY --from=build /app/build /usr/share/nginx/html

# needed this to make React Router work properly 
RUN rm /etc/nginx/conf.d/default.conf
COPY nginx/nginx.conf /etc/nginx/conf.d

# Expose port 80 for HTTP Traffic 
EXPOSE 80

# start the nginx web server

CMD ["nginx", "-g", "daemon off;"]
