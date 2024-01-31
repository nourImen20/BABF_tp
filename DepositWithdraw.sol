//SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;
import "./node_modules/@openzeppelin/contracts/token/ERC20/IERC20.sol";
contract DepositWithdraw{
    IERC20 public Token;
    mapping (address => uint256) public balances; 
    constructor(IERC20 _token){
        Token = _token;
    }
    function deposit(uint256 amount) public {
        Token.transferFrom(msg.sender, address(this),amount);
        balances[msg.sender] += amount;
    }
    function withdraw(uint256 amount) public {
        require(balances[msg.sender]>= amount,"Not enough tokens.");
        balances[msg.sender]-= amount;
        Token.transfer(msg.sender,amount);
        }
}