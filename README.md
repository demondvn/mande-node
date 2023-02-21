# mande-node

## Build
        docker build . -t mande
## Run
        docker run -d --restart unless-stopped -v /mnt/blockstore/mande:/root/.mande-chain -e NODE_NAME=MonPham --name mande mande
## Check
        curl http://localhost:26657/status sync_info "catching_up": false
. Once "catching_up" is false, the sync is complete.
## More
. Read more here [Run validator](https://github.com/mande-labs/testnet-1)
