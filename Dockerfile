# Use the latest stable Rust image as the base
FROM golang:latest

# Install dependencies
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y curl tar wget clang pkg-config libssl-dev jq build-essential git make ncdu
# Set the working directory to /app
WORKDIR /app

# Clone the Andromeda Core repository
RUN git clone https://github.com/mande-labs/testnet-1.git && \
  cp testnet-1/binaries/linux_arm64/mande-chaind /usr/local/bin/mande-chaind && \
  chmod +x mande-chaind


# Build the project

EXPOSE 26656 26657
COPY script.sh script.sh
RUN chmod +x script.sh
# Start the node
CMD ["./script.sh"]
