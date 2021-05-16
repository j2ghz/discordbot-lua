FROM alpine:3
RUN apk --no-cache add curl

# broken: RUN curl -L https://github.com/luvit/lit/raw/master/get-lit.sh | sh
# manual:
RUN curl -L 'https://github.com/luvit/luvi/releases/download/v2.10.1/luvi-regular-Linux_x86_64' > ./luvi && chmod +x ./luvi
RUN curl -L 'https://lit.luvit.io/packages/luvit/lit/v3.8.1.zip' > ./lit.zip && ./luvi lit.zip -- make lit.zip lit luvi && rm -f lit.zip
RUN ./lit make lit://luvit/luvit luvit luvi

ADD . /app
WORKDIR /app/src
ENTRYPOINT ["luvit", "./main.lua"]
