// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

contract EtherPiggyBank {


    mapping ( address => uint256 ) public balances; // Mapping of address to balance

    function deposit () public payable  {
        require(msg.value>0,"Deposit Ether");
        balances[msg.sender] += msg.value;  
    }
    
    function withdraw (uint amount) public {
        require(balances[msg.sender]>=amount, "Insufficient Balance");
        balances[msg.sender] -= amount;
        payable(msg.sender).transfer(amount);
    }

    function CheckBal() public view returns (uint) {
        return balances[msg.sender];
    }
}
