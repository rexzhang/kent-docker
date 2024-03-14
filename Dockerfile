FROM python:3.12-alpine

ARG ENV
ENV TZ="Asia/Shanghai"

RUN if [ "$ENV" = "rex" ]; then echo "Change depends" \
    && pip config set global.index-url http://192.168.200.26:13141/root/pypi/+simple \
    && pip config set install.trusted-host 192.168.200.26 \
    && sed -i 's/dl-cdn.alpinelinux.org/mirrors.tuna.tsinghua.edu.cn/g' /etc/apk/repositories \
    ; fi

COPY requirements.txt /app/requirements.txt

RUN \
    # install depends
    apk add --no-cache --virtual .build-deps build-base libffi-dev \
    && pip install --no-cache-dir -r /app/requirements.txt \
    && apk del .build-deps \
    && find /usr/local/lib/python*/ -type f -name '*.py[cod]' -delete \
    && find /usr/local/lib/python*/ -type d -name "__pycache__" -delete

USER nobody
WORKDIR /app
EXPOSE 8000

CMD ["kent-server", "run", "--host", "0.0.0.0", "--port", "8000"]