# Utilising node version 14 as base image
FROM node:14

# Set /app as working directory
WORKDIR /app

# Copy all project files into working directory
COPY . .

# Set env so the app run in production mode and set the item-db container as database host
ENV NODE_ENV=PRODUCTION DB_HOST=item-db

# Install dependencies needed for production and build the application
RUN npm install --production --unsafe-perm && npm run build

# Expose port 8080 used by application
EXPOSE 8080

# Execute npm run start when container launched
CMD [ "npm", "run", "start" ]