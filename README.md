# arkhamdb-docker

`docker compose` wrapper to quickly run a local [arkhamdb](https://arkhamdb.com/) instance.

# Getting started

> **Warning**  
> This is tailored to previewing the card database and images. This is not a production-ready setup, nor does it currently support developing arkhamdb itself.

1. install [docker](https://docs.docker.com/engine/install/) and [git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git).
2. run the following commands in a shell. If your system does not have `make` installed (e.g. windows), copy the referenced commands from the `Makefile` and run them manually instead when approriate.

```sh
# clone this git repository to a folder and change to it.
git clone https://github.com/fspoettel/arkhamdb-docker && cd arkhamdb-docker

# clone arkhamdb and arkhamdb-json-data repositories.
# !adjust the make command to reference your own forks if needed.!
make setup

# start containers.
docker compose up

# in a second shell...

# on first run, migrate the database.
make migrate

# import cards.
make import-cards
```

✨ You can now access the application at `http://localhost:8000`.

## Updating cards & images while running

The folders `<repo>/arkhamdb-json-data` and `<repo>/images` are mounted into the running docker container.

Changes to files in the images folder will be visible in the "Browse" view immediately.

In order to update card data or images in the deck builder view, run `make import-cards` again after making changes and confirm the new card data version in the application UI.

## Accessing the internal database

```
host: 127.0.0.1
port: 3307
database: symfony
user: symfony_user
password: symfony_password
```

## Creating a user login

1. Register via the application user interface.
2. Connect to the database with a SQL editor (e.g. [TablePlus](https://tableplus.com/)), using the credentials referenced above.
3. Navigate to the `users` table and find the record pointing to the user you registered.
4. Set the `enabled` field to `1`.
5. You can now login.

## Creating an OAuth app

If you need to develop against ArkhamDB's OAuth gateway, you can create an oauth client by running the following command. By default, this will create a client with `grant_types` set to `["authorization_code", "refresh_token"]`.

```sh
make redirect_uri="<url>" name="<name>" create-oauth-app
```

The command will output the `client_id` and `client_secret`.

Authorization endpoint: `http://localhost:8000/oauth/v2/auth`
