# pragma version 0.4.3
"""
@license MIT
@title Mood NFT
"""
from snekmate.tokens import erc721
from snekmate.auth import ownable

initializes: ownable
initializes: erc721[ownable := ownable]

exports: erc721.__interface__

NAME: constant(String[25]) = "MoodNFT"
SYMBOL: constant(String[5]) = "MOOD"
BASE_URI: constant(String[34]) = ""
EIP_712_VERSION: constant(String[1]) = "1"

happy_svg_uri: immutable(String[800])
sad_svg_uri: immutable(String[800])

@deploy
def __init__(_happy_svg_uri: String[800], _sad_svg_uri: String[800]):
    ownable.__init__()
    erc721.__init__(NAME, SYMBOL, BASE_URI, NAME, EIP_712_VERSION)
    happy_svg_uri = _happy_svg_uri
    sad_svg_uri = _sad_svg_uri


