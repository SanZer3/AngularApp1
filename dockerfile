# Utiliser l'image Node.js pour construire l'application
FROM node:14 AS build
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build --prod

# Utiliser l'image Nginx pour servir l'application
FROM nginx:alpine
COPY --from=build /app/dist/AngularApp1 /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
