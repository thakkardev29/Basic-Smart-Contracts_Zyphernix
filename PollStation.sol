// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PollStation {
    string[5] public favcandidate = ["Alice", "Bob", "Charlie", "David", "Eve"];
    uint256[5] public vote;

    mapping(address => uint256) public voted;

    function voting(uint candidateIndex) public {
        require (candidateIndex<5, "Invalid Index");        
        require (voted[msg.sender] == 0, "Already Voted");
        vote[candidateIndex] += 1;       
    }

    function getVotes() public view returns (uint256[5] memory) {
        return vote;
    }
}
