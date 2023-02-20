#!/bin/bash
# mande-chaind keys add wallet
mkdir ${HOME}/.mande-chaind && mkdir ${HOME}/.mande-chaind/config
mande-chaind init $NODE_NAME --chain-id mande-testnet-1

wget https://raw.githubusercontent.com/mande-labs/testnet-1/main/genesis.json -O ${HOME}/.mande-chaind/config/genesis.json
SEEDS="cd3e4f5b7f5680bbd86a96b38bc122aa46668399@34.171.132.212:26656"
PEERS="ee8a1b98e931e81d32c52f0b489fa22b52778d7c@34.171.132.212:26656,6780b2648bd2eb6adca2ca92a03a25b216d4f36b@34.170.16.69:26656"
sed -i 's|^seeds *=.*|seeds = "'$SEEDS'"|; s|^persistent_peers *=.*|persistent_peers = "'$PEERS'"|' $HOME/.mande-chaind/config/config.toml

sed -i 's|^minimum-gas-prices *=.*|minimum-gas-prices = "0.005mand"|g' $HOME/.mande-chaind/config/app.toml

mande-chaind start