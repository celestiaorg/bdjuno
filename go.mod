module github.com/forbole/bdjuno/v2

go 1.16

require (
	github.com/celestiaorg/celestia-app v0.0.0-20220125123954-2015a0cac19c
	github.com/cosmos/cosmos-sdk v0.44.3
	github.com/cosmos/gaia/v6 v6.0.0-rc1
	github.com/forbole/juno/v2 v2.0.0-20211221122008-f95aacf17add
	github.com/go-co-op/gocron v1.11.0
	github.com/gogo/protobuf v1.3.3
	github.com/jmoiron/sqlx v1.2.1-0.20200324155115-ee514944af4b
	github.com/lib/pq v1.10.4
	github.com/pelletier/go-toml v1.9.4
	github.com/proullon/ramsql v0.0.0-20181213202341-817cee58a244
	github.com/rs/zerolog v1.26.1
	github.com/spf13/cobra v1.3.0
	github.com/stretchr/testify v1.7.0
	github.com/tendermint/tendermint v0.34.14
	google.golang.org/grpc v1.42.0
	gopkg.in/yaml.v3 v3.0.0-20210107192922-496545a6307b
)

replace (
	github.com/cosmos/cosmos-sdk => github.com/celestiaorg/cosmos-sdk v0.44.1-celestia
	github.com/forbole/juno/v2 v2.0.0-20211221122008-f95aacf17add => github.com/celestiaorg/juno/v2 v2.1.0-celestia
	github.com/gogo/protobuf => github.com/regen-network/protobuf v1.3.3-alpha.regen.1
	github.com/tendermint/tendermint => github.com/celestiaorg/celestia-core v0.34.14-celestia.0.20220119223021-e54097114e14
	google.golang.org/grpc => google.golang.org/grpc v1.33.2
)
