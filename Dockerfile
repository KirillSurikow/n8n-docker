FROM n8nio/n8n:latest

USER root
RUN mkdir -p /opt/render/n8n/n8n && \
    chown -R node:node /opt/render/n8n

USER node
ENV PATH /usr/local/lib/node_modules/n8n/bin:$PATH

EXPOSE 5678

CMD ["n8n", "start", "--tunnel"]