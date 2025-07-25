// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

contract SaveDetails {
    string public name;
    string public bio;

    function userdetails(string memory _name, string memory _bio) public {
        name = _name;
        bio = _bio;
    }
}
