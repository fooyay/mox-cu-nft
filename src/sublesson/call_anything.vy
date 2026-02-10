# pragma version 0.4.3
"""
@license MIT
@title Call Anything Workshop
"""


some_address: public(address)
amount: public(uint256)
SELECTOR_ONE: constant(Bytes[4]) = method_id("transfer(address,uint256)", output_type=Bytes[4])
@external
def transfer(to: address, amount: uint256):
    self.some_address = to
    self.amount = amount


@internal
@view
def _get_selector_one() -> Bytes[4]:
    return method_id("transfer(address,uint256)", output_type=Bytes[4])
    
@external
@view
def get_selector_one() -> Bytes[4]:
    return self._get_selector_one()

@external
@view
def get_data_to_call_transfer(some_address: address, amount: uint256) -> Bytes[100]:
    # selector: Bytes[4] = self._get_selector_one()
    # Can't do 'method_id=selector', you get a type error about 'Bytes[4] not being a literal',
    # so we have to use the method_id function directly in the abi_encode call
    # return abi_encode(some_address, amount, method_id=method_id("transfer(address,uint256)", output_type=Bytes[4]))
    # or, it also works as a constant
    return abi_encode(some_address, amount, method_id=SELECTOR_ONE)