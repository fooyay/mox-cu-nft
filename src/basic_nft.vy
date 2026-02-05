# pragma version 0.4.3
"""
@license MIT
@title Puppy NFT
"""
from snekmate.tokens import erc721
from snekmate.auth import ownable

initializes: ownable
initializes: erc721[ownable := ownable]

exports: erc721.__interface__

NAME: constant(String[25]) = "PuppyNFT"
SYMBOL: constant(String[5]) = "PUPPY"
BASE_URI: constant(String[7]) = "ipfs://"
EIP_712_VERSION: constant(String[1]) = "1"


@deploy
def __init__():
    ownable.__init__()
    erc721.__init__(NAME, SYMBOL, BASE_URI, NAME, EIP_712_VERSION)