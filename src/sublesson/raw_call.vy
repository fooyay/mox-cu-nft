# pragma version 0.4.3
"""
@license MIT
@title Call Anything Workshop
"""

TRANSFER_SELECTOR: constant(Bytes[4]) = method_id("transfer(address,uint256)")
OUTSIZE: constant(uint256) = 32

@external
def call_function_directly(address_to_call: address, new_amount: uint256, update_address: address) -> Bytes[OUTSIZE]:
    success: bool = False
    response: Bytes[OUTSIZE] = b""
    success, response = raw_call(
        address_to_call,
        abi_encode(
            update_address,
            new_amount,
            method_id=TRANSFER_SELECTOR,
        ),
        max_outsize=OUTSIZE,
        revert_on_failure=False,
    ) 
    assert success, "Call failed"
    return response