# arkhamdb-docker

`docker compose` wrapper to quickly run a local [arkhamdb](https://arkhamdb.com/) instance.

# Getting started

> **Note**  
> This is tailored to previewing the card database and images. This is not a production-ready setup, nor does it currently support developing arkhamdb itself.

```sh
# install a recent version of `docker` and `git`.

# clone this repo.
git clone https://github.com/fspoettel/arkhamdb-docker && cd arkhamdb-docker

# add arkhamdb & arkhamdb-json-data as submodules repositories.
make setup

# start containers.
docker compose up

# in a second shell...

# on first run, migrate the database.
make migrate

# import cards.
make import-cards
```

You can now access the application at `http://localhost:8000`.

## Updating cards & images while running

The folders `arkhamdb-json-data` and `images` are mounted into the docker container. Thus, changes to images will be visible immediately in the running application.  
In order to see card changes, run `make import-cards` again.
