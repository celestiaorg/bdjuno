# BDJuno
[![GitHub Workflow Status](https://img.shields.io/github/workflow/status/forbole/bdjuno/Tests)](https://github.com/forbole/bdjuno/actions?query=workflow%3ATests)
[![Go Report Card](https://goreportcard.com/badge/github.com/forbole/bdjuno)](https://goreportcard.com/report/github.com/forbole/bdjuno)
![Codecov branch](https://img.shields.io/codecov/c/github/forbole/bdjuno/cosmos/v0.40.x)

BDJuno (shorthand for BigDipper Juno) is the [Juno](https://github.com/forbole/juno) implementation
for [BigDipper](https://github.com/forbole/big-dipper).

It extends the custom Juno behavior by adding different handlers and custom operations to make it easier for BigDipper
showing the data inside the UI.

All the chains' data that are queried from the RPC and gRPC endpoints are stored inside
a [PostgreSQL](https://www.postgresql.org/) database on top of which [GraphQL](https://graphql.org/) APIs can then be
created using [Hasura](https://hasura.io/).

## Usage

### Set up the database
Follow the guide in big dipper [docs](https://docs.bigdipper.live/cosmos-based/parser/database) and create the DB schema needed.

### Set up and run BDJuno for Celestia
#### Install BDJuno
First, clone this repo:
```shell
$ git clone https://github.com/celestiaorg/bdjuno
```

Then, make sure you are on the `celestia/0.44.x` branch:
```shell
$ cd bdjuno
$ git branch | grep '*' #should print: celestia/0.44.x
```

Now, let's install BDJuno:
```shell
$ make install
$ bdjuno #should print the usage
```

#### Initialize the configuration
You can initialize the configuration using:
```shell
$ bdjuno init
```
This will create such file inside the `~/.bdjuno` folder.

If you want to change the home directory of your configuration, refer to [docs](https://docs.bigdipper.live/cosmos-based/parser/setup#initializing-the-configuration).

Then, update the configuration under `~/.bdjuno/config.yaml` to reflect the following:
```yaml
chain:
    bech32_prefix: celes
    modules: 
      - modules 
      - messages
      - auth
      - bank
      - consensus
      - gov
      - mint
      - pricefeed
      - slashing
      - staking
      - distribution
      - history
node:
    type: remote
    config:
            rpc:
                    client_name: juno
                    address: http://<host>:<port (26657 default)>
                    max_connections: 40
            grpc:
                    address: http://<host>:<port (9090 default)>
                    insecure: true
parsing:
    workers: <number of workers (the more, the faster, the more resources intensive)
    listen_new_blocks: true
    parse_old_blocks: true
    parse_genesis: true
    start_height: 1
database:
    name: <db_name>
    host: <host>
    port: <port>
    user: <username>
    password: <password>
    schema: <schema>
    max_open_connections: 1
    max_idle_connections: 1
logging:
    level: debug 
    format: text
pricefeed:
  tokens:
    - name: Celes
      units:
       - denom: uceles
         exponent: 0
       - denom: celes
         exponent: 6
         price_id: celestia
distribution:
  rewards_frequency: 100
```

Now, you can run BDJuno using: 
```shell
$ bdjuno parse
```
And, also set it as a service following the [docs](https://docs.bigdipper.live/cosmos-based/parser/setup#running-bdjuno).

### Set up Hasura
Follow the steps in [here](https://docs.bigdipper.live/cosmos-based/parser/hasura).

For more information, refer to the [docs website](https://docs.bigdipper.live/cosmos-based/overview/).

Then, you can move to [big dipper](https://github.com/celestiaorg/big-dipper-2.0-cosmos) to set up the UI.

## Testing
If you want to test the code, you can do so by running

```shell
$ make test-unit
```

**Note**: Requires [Docker](https://docker.com).

This will:
1. Create a Docker container running a PostgreSQL database.
2. Run all the tests using that database as support.


