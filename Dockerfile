FROM n8nio/n8n:latest

USER root
RUN mkdir -p /data && chown -R node:node /data

RUN npm install n8n -g

USER node
ENV N8N_USER_FOLDER=/data
WORKDIR /data

EXPOSE 5678

HEALTHCHECK --interval=30s --timeout=30s --start-period=30s --retries=3 \
  CMD curl -f http://localhost:5678/healthz || exit 1

CMD ["n8n", "start", "--tunnel", "--host=0.0.0.0"]