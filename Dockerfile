FROM node:18

# Criar diretório da aplicação
WORKDIR /app

# Copiar backend e instalar dependências
COPY backend ./backend
WORKDIR /app/backend
RUN npm init -y
RUN npm install express cors

# Voltar para raiz
WORKDIR /app

# Copiar frontend
COPY frontend ./frontend

# Expor porta
EXPOSE 3001

# Rodar backend
CMD ["node", "backend/server.js"]
