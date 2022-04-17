FROM ubuntu:20.04 AS stage
RUN apt-get update && \
    apt-get install -y wget && \
    apt-get upgrade -y && \
    wget https://github.com/cloudflare/cloudflared/releases/download/2022.4.1/cloudflared-linux-arm64.deb && \
    dpkg -i cloudflared-linux-arm64.deb
FROM stage
CMD ["cloudflared","tunnel","run"]
