// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

contract Counter {
    uint256 public count;

    function click() public {
        count += 1;
    }

    function decrement() public {
        require(count > 0, "Count Can't be 0");
        count -= 1;
    }
}
