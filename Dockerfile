# Use lightweight Node.js image
FROM node:20-alpine

# Create app directory
WORKDIR /usr/src/app

# Copy package.json and install dependencies
COPY package*.json ./
RUN npm install --production

# Copy app files
COPY . .

# Expose port and run
EXPOSE 3000
CMD ["node", "app.js"]
