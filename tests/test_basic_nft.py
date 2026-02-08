def test_name_and_symbol(nft):
    assert nft.name() == "PuppyNFT"
    assert nft.symbol() == "PUPPY"


def test_only_one_token_minted(nft):
    assert nft.number_of_tokens() == 1
