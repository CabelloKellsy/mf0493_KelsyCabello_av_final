# indicar que imagen se quiere utilizar, descarga la aimgen de node 23 y si no tiene lo va isntalar
#version de imagen mas reducida
FROM node:23

#directorio de la aplicacion, del trabajo dentro de la maquina virtual
WORKDIR /app

#los modulos lo llamaremos desde la imagen

#copia toda la instrucciones desde el directorio a la maquina virtual
# COPY . .

#otra forma copia toda la instrucciones desde el directorio a la maquina virtual, excepto .dockerignore
COPY package*.json  ./

# ejecutar las sentencias: instalar todo los modulos, eliminar el cache
RUN npm install \
    && npm cache clean --force \
    && rm -rf /tmp/* /root/.npm/_cacache

# copiar el resto del proyecto
COPY . .

#indicar el puerto que usara la maquina virutal
EXPOSE 5000

#ejecutar el finchero de la aplicacion, OJO quitar el "start": "node --watch ./src/index.js",
CMD ["npm", "start"]

# construir la imagen en terminal gitbash con docker build -t express-travels:v3