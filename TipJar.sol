// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

contract TipJar {

    address public owner;

    mapping(address => uint) public etherTips;
    mapping(address => uint) public usdTips;
    mapping(address => uint) public eurTips;

    uint public totalEtherReceived;
    uint public usdToWeiRate = 0.0005 ether; 
    uint public eurToWeiRate = 0.00055 ether;

    constructor() {
        owner = msg.sender;
    }

    function tipEther() public payable {
        require(msg.value > 0, "Send some ETH");
        etherTips[msg.sender] += msg.value;
        totalEtherReceived += msg.value;
    }

    function UsdTipDummy(uint usdAmount) public {
        uint weiEquivalent = usdAmount * usdToWeiRate;
        usdTips[msg.sender] += weiEquivalent;
    }

    function EurTipDummy(uint eurAmount) public {
        uint weiEquivalent = eurAmount * eurToWeiRate;
        eurTips[msg.sender] += weiEquivalent;
    }

    function getEtherBalance() public view returns (uint) {
        return address(this).balance;
    }

    function withdrawAll() public {
        require(msg.sender == owner, "Only owner can withdraw");
        payable(owner).transfer(address(this).balance);
    }

    function getUserSummary(address user) public view returns (
        uint etherAmount,
        uint usdDummy,
        uint eurDummy
    ) 
    {
        etherAmount = etherTips[user];
        usdDummy = usdTips[user];
        eurDummy = eurTips[user];
    }
}
