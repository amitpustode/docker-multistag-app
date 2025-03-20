# ================================
# Stage 1: Build
# ================================
FROM node:18 AS build
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# ================================
# Stage 2: Test
# ================================
FROM node:18 AS test
WORKDIR /app
COPY --from=build /app .
RUN npm test

# ================================
# Stage 3: Sonar Check
# ================================
FROM sonarsource/sonar-scanner-cli AS sonar
WORKDIR /app
COPY --from=build /app .

# ================================
# Stage 4: Run
# ================================
FROM httpd:2.4 AS run
WORKDIR /usr/local/apache2/htdocs/
COPY --from=build /app/dist/ .
EXPOSE 80
CMD ["httpd-foreground"]
