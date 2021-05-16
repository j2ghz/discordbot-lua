FROM alpine:3
RUN curl -L https://github.com/luvit/lit/raw/master/get-lit.sh | sh
ADD . /app
WORKDIR /app/src
ENTRYPOINT ["luvit", "./main.lua"]
