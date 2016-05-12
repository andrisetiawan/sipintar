FROM elixir:latest
RUN mix archive.install https://github.com/phoenixframework/archives/raw/master/phoenix_new.ez --force

RUN mkdir -p /phoenixapp
WORKDIR /phoenixapp

COPY mix.exs /phoenixapp/
COPY mix.lock /phoenixapp/
RUN mix local.hex --force
RUN mix deps.get --force

COPY . /phoenixapp

# ENV PORT 8080
# ENV MIX_ENV prod
RUN mix deps.compile

# EXPOSE 8080
EXPOSE 4000
ENTRYPOINT mix phoenix.server

#CMD ruby runner.rb


# docker build -t sipintar .
# docker run -p 0.0.0.0:80:4000 sipintar -it
