// SPDX-License-Identifier: MIT
pragma solidity  0.8.18;

contract errors {
    address public owner;
    uint public score;

    // use require
    function usingRequire(uint _score) public{
        require(owner == msg.sender, "This function is not available to you as you are not the owner");
        score = _score;
    }

    //require(condition);

    // use revert
    function usingRevert(uint _score) public{
        if (owner != msg.sender) {
            revert("Access Denied");
    
        }
        score = _score;
    }

    // use assert
    function usingassert(uint _score) public{
        assert(owner == msg.sender);
        score = _score;
    }

    constructor() {
        owner = msg.sender;
 
    }
}
