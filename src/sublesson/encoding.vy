# pragma version 0.4.3
"""
@license MIT
@title Encoding Workshop
"""

@external
@pure
def combine_strings(string1: String[50], string2: String[50]) -> String[100]:
    return concat(string1, string2)

@external
@pure
def encode_number() -> Bytes[128]:
    amount: uint256 = 1
    return abi_encode(amount)

@internal
@pure
def _encode_string() -> Bytes[128]:
    my_string: String[50] = "Hello, Moccasin!"
    return abi_encode(my_string)

@external
@pure
def encode_string() -> Bytes[128]:
    return self._encode_string()

@external
@pure 
def decode_string() -> String[50]:
    return abi_decode(self._encode_string(), String[50])
    
@internal
@pure
def _multi_encode() -> Bytes[160]:
    amount: uint256 = 1
    my_string: String[50] = "Hello, Moccasin!"
    return abi_encode(amount, my_string)
    
@external
@pure
def multi_encode() -> Bytes[160]:
    return self._multi_encode()
    
@external
@pure
def multi_decode() -> (uint256, String[50]):
    encoded: Bytes[160] = self._multi_encode()
    return abi_decode(encoded, (uint256, String[50]))    

    

