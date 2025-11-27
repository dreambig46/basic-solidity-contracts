// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/*
  My first smart contract - MW3Labs
  Created by a Web3 beginner with real crypto experience
*/

contract SimpleToken {

    string public name = "MW3 Token";
    string public symbol = "MW3";
    uint256 public totalSupply = 1000000;

    address public owner;

    mapping(address => uint256) public balance;

    constructor() {
        owner = msg.sender;
        balance[owner] = totalSupply;
    }

    function transfer(address _to, uint256 _amount) public {
        require(balance[msg.sender] >= _amount, "Not enough balance");
        
        balance[msg.sender] -= _amount;
        balance[_to] += _amount;
    }

    function checkBalance(address _user) public view returns (uint256) {
        return balance[_user];
    }
}
