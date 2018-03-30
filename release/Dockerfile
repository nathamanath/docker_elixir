FROM elixir:1.6-alpine

RUN apk add --update bash && rm -rf /var/cache/apk/*

# Substitue env vars in elixir config
ENV REPLACE_OS_VARS=true

# Create a non root user
RUN adduser -D -H -s /bin/bash elixiruser

# Healthcheck
COPY ./healthcheck.sh /usr/local/bin/healthcheck
RUN chmod +x /usr/local/bin/healthcheck
HEALTHCHECK CMD ["/usr/local/bin/healthcheck"]

# Entrypoint script
COPY ./entrypoint.sh /usr/local/bin/entrypoint
RUN chmod +x /usr/local/bin/entrypoint

ONBUILD ARG APP_NAME
ONBUILD ARG APP_VERSION
ONBUILD ARG ELIXIR_ENV=prod

ONBUILD ENV APP_NAME=$APP_NAME
ONBUILD ENV APP_VERSION=$APP_VERSION
ONBUILD ENV ELIXIR_ENV=$ELIXIR_ENV

ONBUILD ENV RELEASE_MUTABLE_DIR=/var/$APP_NAME
ONBUILD ENV START_ERL_DATA=/var/$APP_NAME/start_data.erl

# Copy in app release
ONBUILD COPY ./_build/$ELIXIR_ENV/rel/$APP_NAME/releases/$APP_VERSION/$APP_NAME.tar.gz /opt/$APP_NAME/
ONBUILD WORKDIR /opt/$APP_NAME
ONBUILD RUN chown -R elixiruser /opt/$APP_NAME
ONBUILD RUN tar xvf $APP_NAME.tar.gz
ONBUILD RUN rm $APP_NAME.tar.gz
ONBUILD RUN mkdir /opt/$APP_NAME/var /var/$APP_NAME

CMD entrypoint.sh
