# base {{{
FROM node:12.19-buster as base
WORKDIR /src

RUN apt-get update -qq &&\
    apt-get install -y make

COPY package.json yarn.lock .
RUN yarn install

COPY . .
RUN make
# }}}

FROM caddy
COPY --from=base /src/dist/* /usr/share/caddy/

