# Dockerfile — builds the PiCard image.
# Pi Desktop only pulls published images, so build + push this yourself:
#
#   docker build -t ghcr.io/YOUR-ORG/picard:latest .
#   docker push ghcr.io/YOUR-ORG/picard:latest
#
# Then point docker-compose.yml at that pushed tag.

FROM nginx:1.27-alpine

# Static site — index.html is the whole app, nothing else needed.
COPY index.html /usr/share/nginx/html/index.html

# nginx's default image listens on port 80 — repoint it to 8080
# to match docker-compose.yml below.
RUN sed -i 's/listen\s*80;/listen 8080;/' /etc/nginx/conf.d/default.conf

EXPOSE 8080
