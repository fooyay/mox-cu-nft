# pragma version 0.4.3
"""
@license MIT
@title Mood NFT
"""
from snekmate.tokens import erc721
from snekmate.auth import ownable
from snekmate.utils import base64

initializes: ownable
initializes: erc721[ownable := ownable]

# exports: erc721.__interface__

NAME: constant(String[25]) = "MoodNFT"
SYMBOL: constant(String[5]) = "MOOD"
BASE_URI: constant(String[34]) = ""
EIP_712_VERSION: constant(String[1]) = "1"

happy_svg_uri: immutable(String[800])
sad_svg_uri: immutable(String[800])
FINAL_STRING_SIZE: constant(uint256) = (4 * base64._DATA_OUTPUT_BOUND) + 80
JSON_BASE_URI_SIZE: constant(uint256) = 29
JSON_BASE_URI: constant(String[JSON_BASE_URI_SIZE]) = "data:application/json;base64,"
IMG_BASE_URI_SIZE: constant(uint256) = 26
IMG_BASE_URI: constant(String[IMG_BASE_URI_SIZE]) = "data:image/svg+xml;base64,"

@deploy
def __init__(_happy_svg_uri: String[800], _sad_svg_uri: String[800]):
    ownable.__init__()
    erc721.__init__(NAME, SYMBOL, BASE_URI, NAME, EIP_712_VERSION)
    happy_svg_uri = _happy_svg_uri
    sad_svg_uri = _sad_svg_uri

@external
@view
def tokenURI(token_id: uint256) -> String[FINAL_STRING_SIZE]:
    image_uri: String[800] = happy_svg_uri

    json_string: String[1024] = concat(
        '{"name":"',
        NAME,
        '", "description":"An NFT that reflects the mood of the owner, 100% on Chain!", ',
        '"attributes": [{"trait_type": "moodiness", "value": 100}], "image":"',
        image_uri,
        '"}',
    )
    json_bytes: Bytes[1024] = convert(json_string, Bytes[1024])
    encoded_chunks: DynArray[
        String[4], base64._DATA_OUTPUT_BOUND
    ] = base64._encode(json_bytes, True)

    result: String[FINAL_STRING_SIZE] = JSON_BASE_URI

    counter: uint256 = JSON_BASE_URI_SIZE
    for encoded_chunk: String[4] in encoded_chunks:
        result = self.set_indice_truncated(result, counter, encoded_chunk)
        counter += 4
    return result

@external
@pure
def svg_to_uri(svg: String[1024]) -> String[FINAL_STRING_SIZE]:
    svg_bytes: Bytes[1024] = convert(svg, Bytes[1024])
    encoded_chunks: DynArray[
        String[4], base64._DATA_OUTPUT_BOUND
    ] = base64._encode(svg_bytes, True)
    result: String[FINAL_STRING_SIZE] = JSON_BASE_URI

    counter: uint256 = IMG_BASE_URI_SIZE
    for encoded_chunk: String[4] in encoded_chunks:
        result = self.set_indice_truncated(result, counter, encoded_chunk)
        counter += 4
    return result

@internal
@pure
def set_indice_truncated(
    result: String[FINAL_STRING_SIZE], index: uint256, chunk_to_set: String[4]
) -> String[FINAL_STRING_SIZE]:
    """
    We set the index of a string, while truncating all values after the index
    """
    buffer: String[FINAL_STRING_SIZE * 2] = concat(
        slice(result, 0, index), chunk_to_set
    )
    return abi_decode(abi_encode(buffer), (String[FINAL_STRING_SIZE]))