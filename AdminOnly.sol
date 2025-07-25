// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

contract AdminOnly {

    address public owner;
    uint public treasure;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        _;
    }

    function addValue(uint amount) public onlyOwner {
        treasure += amount;
    }

    mapping(address => uint) public allowed;
    mapping(address => bool) public withdrawal;  

     function allow(address user, uint amount) public onlyOwner {
        allowed[user] = amount;
    }

    function withdraw() public {
        require(allowed[msg.sender] > 0, "Not Approved");
        require(!withdrawal[msg.sender], "Already Withdrawn");
        require(treasure >= allowed[msg.sender], "Not enough treasure");

        treasure -= allowed[msg.sender];
        withdrawal[msg.sender] = true;
    }

    function resetStatus(address user) public onlyOwner {
        withdrawal[user] = false;
    }

    function transferOwnership(address newOwner) public onlyOwner {
        owner = newOwner;
    }
    
}
