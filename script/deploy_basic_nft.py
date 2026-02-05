from src import basic_nft

PUG_URI = "QmW16U98JrY9HBY36rQtUuUtDnm6LdEeNdAAggmrx3thMa"


def deploy_basic_nft():
    contract = basic_nft.deploy()
    contract.mint(PUG_URI)
    token_metadata = contract.tokenURI(0)
    print(f"Basic NFT deployed to {contract.address}")
    print(f"Token URI: {token_metadata}")


def moccasin_main():
    deploy_basic_nft()
