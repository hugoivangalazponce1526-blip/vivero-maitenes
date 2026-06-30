# ── Stage 1: instalar dependencias ──────────────────────────────────────────
FROM node:22-alpine AS build
WORKDIR /app
COPY package*.json ./
RUN npm ci --only=production

# ── Stage 2: imagen final de runtime ────────────────────────────────────────
FROM node:22-alpine AS runtime
WORKDIR /app

COPY --from=build /app/node_modules ./node_modules
COPY . .

EXPOSE 3000

CMD ["node", "server.js"]
