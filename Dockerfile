# Use node:18-alpine as image
FROM node:18-alpine

# Set work directory
WORKDIR /app

# Copy paste package.json and package-lock.json into work directory
COPY . .

# Install node dependencies with clean install
RUN npm ci

# Add bash
RUN apk add --no-cache bash

# Get wait-for-it bash script
RUN wget -O /bin/wait-for-it.sh https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh

# Make it executable
RUN chmod +x /bin/wait-for-it.sh

# Run index.js
CMD ["node", "index.js"]
 
# Expose port 3000
EXPOSE 3000
