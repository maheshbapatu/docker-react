# This Docker file used during production phase.
# BUILD PHASE, building the code that is required in production environment.
FROM node:alpine as builder
WORKDIR '/app'

COPY package.json .
RUN npm install
COPY . .
RUN npm run build


#RUN PHASE
#Single block consists of single FROM statement
FROM nginx
#Copy something from the above builder phase
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html