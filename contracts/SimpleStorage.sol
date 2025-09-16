// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract SimpleStorage {
    uint256 public value;

    event ValueSet(uint256 newValue);

    function set(uint256 _v) public {
        value = _v;
        emit ValueSet(_v);
    }

    function get() public view returns (uint256) {
        return value;
    }
}
