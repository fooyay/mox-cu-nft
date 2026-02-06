from src import basic_nft

# This points to a full JSON metadata file stored on IPFS
PUG_URI = "QmW16U98JrY9HBY36rQtUuUtDnm6LdEeNdAAggmrx3thMa"

# These point to just the image file stored on IPFS
CENTRALIZED_URI = "QmanoFs6a4GHRtTW32w1fFJSv61TFT8Vk9qKqFF1mcdjMK"
MONKEY_URI = "QmaKJVC9cCRCK39FBJ5t5v52FqZAdzLV7xqS1LfJ4NuiUu"


def deploy_basic_nft():
    contract = basic_nft.deploy()
    # contract.mint(PUG_URI)
    contract.mint(MONKEY_URI)
    token_uri = contract.tokenURI(0)
    print(f"Basic NFT deployed to {contract.address}")
    print(f"Token URI: {token_uri}")


def moccasin_main():
    deploy_basic_nft()
