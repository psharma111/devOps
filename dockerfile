FROM node:14 
WORKDIR  /app
COPY frontend/package.json frontend/yarn.lock ./
RUN yarn
COPY frontend ./
RUN yarn build

# Build backend
FROM node:14
WORKDIR /app
COPY backend/package.json backend/yarn.lock ./
RUN yarn
COPY backend ./

# Copy built frontend to backend
COPY --from=builder /app/build /app/public

EXPOSE 3000
CMD ["node", "server.js"]
