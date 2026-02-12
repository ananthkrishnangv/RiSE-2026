FROM node:23-slim AS builder

WORKDIR /app
COPY package*.json ./
# Install build dependencies for better-sqlite3
RUN apt-get update && apt-get install -y python3 make g++ && rm -rf /var/lib/apt/lists/*
RUN npm install

COPY . .
ENV ADAPTER=node
RUN npm run build
RUN npm prune --production

FROM node:23-slim

WORKDIR /app
COPY --from=builder /app/build build/
COPY --from=builder /app/node_modules node_modules/
COPY package.json .

# Create volume dir and ensure it's writable
RUN mkdir -p /data
ENV DATABASE_PATH=/data/rise.db

EXPOSE 3000
ENV NODE_ENV=production
ENV PORT=3000
# Allow origin for form actions (update with actual domain/IP if needed)
ENV ORIGIN=http://10.30.0.35

CMD [ "node", "build" ]
