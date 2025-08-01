// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

contract SimpleIOU {
    mapping(address => uint) public balances;
    mapping(address => mapping(address => uint)) public debts; //nested mapping 

    function deposit() public payable {
        balances[msg.sender] += msg.value;
    }

    function loan(address friend, uint amount) public payable {
        require(balances[msg.sender] >= amount, "Not enough balance to process loan");

        balances[msg.sender] -= amount;
        debts[friend][msg.sender] += amount; 
    }

    function repay(address lender, uint amount) public payable {
        require(amount > 0, "Repay Amount Must be Greater than 0");
        require(debts[msg.sender][lender] >= amount, "You don't this much");
        require(msg.value == amount, "Amount does not match");

        debts[msg.sender][lender] -= amount;
        balances[lender] += amount;
    }

    function getIOU(address borrower) public view returns (uint) {
        return debts[borrower][msg.sender];
    }

    function withdraw(uint amount) public {
        require(balances[msg.sender] >= amount, "Not enough balance");

        balances[msg.sender] -= amount;
        payable(msg.sender).transfer(amount);
    }
}
