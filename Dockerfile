FROM node:21

# Set the directory

WORKDIR /usr/src/app

COPY package*.json ./

# Dependencies

RUN npm install

COPY . .

# Set port

EXPOSE 3000

# Run the application

CMD ["node", "app.js"]
