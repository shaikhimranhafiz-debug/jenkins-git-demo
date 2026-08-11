FROM debian:bookworm-slim

RUN useradd -m -s /bin/bash appuser

WORKDIR /app

COPY app.sh /app/app.sh

RUN chmod +x /app/app.sh

USER appuser

CMD ["/app/app.sh"]

