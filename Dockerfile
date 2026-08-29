FROM ubuntu:20.04
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y curl bash wget unzip
WORKDIR /app
COPY . .
RUN chmod +x *.sh
EXPOSE 80 443
CMD ["bash", "setup.sh"]
