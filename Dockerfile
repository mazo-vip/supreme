FROM ubuntu:20.04
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y curl bash wget unzip
WORKDIR /app
COPY . .
# تحميل أحدث نسخة من xray وتثبيتها بشكل نظيف لتجنب أي تعارض في المجلدات القديمة
RUN wget https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip && \
    unzip Xray-linux-64.zip -d xray_bin && \
    chmod +x xray_bin/xray
EXPOSE 443
CMD ["./xray_bin/xray", "-config", "config.json"]
