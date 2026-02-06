from src import basic_nft

PUG_URI = "QmW16U98JrY9HBY36rQtUuUtDnm6LdEeNdAAggmrx3thMa"
CENTRALIZED_URI = "QmanoFs6a4GHRtTW32w1fFJSv61TFT8Vk9qKqFF1mcdjMK"


def deploy_basic_nft():
    contract = basic_nft.deploy()
    # contract.mint(PUG_URI)
    contract.mint(CENTRALIZED_URI)
    token_uri = contract.tokenURI(0)
    print(f"Basic NFT deployed to {contract.address}")
    print(f"Token URI: {token_uri}")


def moccasin_main():
    deploy_basic_nft()
