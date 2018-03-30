FROM elixir:1.6-alpine

ARG APP_NAME
ARG APP_VERSION

RUN mix local.hex --force
RUN mix local.rebar --force

WORKDIR /var/app
