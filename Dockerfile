FROM node:18

WORKDIR /app

# Copiar backend e instalar dependências
COPY backend/package*.json ./backend/
WORKDIR /app/backend
RUN npm install

# Copiar todo backend
COPY backend/ ./backend/

# Copiar frontend
WORKDIR /app
COPY frontend/ ./frontend/

EXPOSE 3001

CMD ["node", "backend/server.js"]