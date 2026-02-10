import pytest
from script.deploy_basic_nft import deploy_basic_nft
from script.deploy_mood_nft import deploy_mood_nft


@pytest.fixture(scope="function")
def nft():
    contract = deploy_basic_nft()
    return contract


@pytest.fixture(scope="function")
def mood_nft():
    contract = deploy_mood_nft()
    return contract
