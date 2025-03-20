# Stage 1: Build the Static Website
FROM node:18 AS builder
# Set working directory
WORKDIR /app
# Copy package.json and package-lock.json (if using dependencies)
COPY package*.json ./
# Install dependencies (if any)
RUN npm install
# Copy the rest of the application code
COPY . .
# Build the static files (if using a framework like React, Vue, etc.)
RUN npm run build

# Stage 2: Serve the website with Apache
FROM httpd:2.4
# Copy built static files from builder stage
COPY --from=builder /app/dist/ /usr/local/apache2/htdocs/
# Expose port 80 for the Apache web server
EXPOSE 80
# Start Apache server
CMD ["httpd-foreground"]
