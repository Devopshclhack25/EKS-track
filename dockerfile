#Nginx image as the base image
FROM nginx:latest

# Copy HTML content to the default web server directory
COPY ./index.html /usr/share/nginx/html

# Expose port 80 for HTTP traffic
EXPOSE 80

# Command to start Nginx (already included in the base image)
CMD ["nginx", "-g", "daemon off;"]