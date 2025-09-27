FROM futebas/acestream-engine-arm:3.2.7.6
LABEL maintainer="https://github.com/rusanter"
LABEL version="1.0"
LABEL description="Acestream Proxy with integrated Acestream Engine"

# Устанавливаем необходимые пакеты
RUN apk add --no-cache \
    bash \
    curl \
    ffmpeg \
    libstdc++ \
    libcurl \
    libxml2 \
    libxslt \
    git \
    net-tools \
    libxslt-dev \
    python2 \
    py2-pip \
    && pip install cffi gevent psutil
   
    git clone --depth=1 https://github.com/Mixanichesky/HTTPAceProxy.git /opt/httpaceproxy && \
    rm -rf /opt/httpaceproxy/.git && \
    sed -i 's/acespawn = False/acespawn = True/' /opt/httpaceproxy/aceconfig.py && \

EXPOSE 8000
CMD ["python", "/opt/httpaceproxy/acehttp.py"]
