import pytest
from script.deploy_basic_nft import deploy_basic_nft


@pytest.fixture(scope="function")
def nft():
    contract = deploy_basic_nft()
    return contract
