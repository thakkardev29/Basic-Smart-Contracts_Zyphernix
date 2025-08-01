// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

import "./Cal.sol";

contract SmartCalculator {
    address public smartcal;

    constructor (address _calculator) {
        smartcal = _calculator;
    }

    function smartadd(uint a, uint b) public view returns (uint) {
        Cal calc = Cal(smartcal);
        return calc.add(a,b);
    }

    function smartsub(uint a, uint b) public view returns (uint) {
        Cal calc = Cal(smartcal);
        return calc.sub(a,b);
    }

    function smartmul(uint a, uint b) public view returns (uint) {
        Cal calc = Cal(smartcal);
        return calc.mul(a,b);
    }

    function smartdiv(uint a, uint b) public view returns (uint) {
        Cal calc = Cal(smartcal);
        return calc.div(a,b);
    }



    }

