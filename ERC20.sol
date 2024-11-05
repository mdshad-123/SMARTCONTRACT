// SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

import "./IERC20.sol";

contract ERC20 is IERC20
{
    uint public toralSupply =21000000;
    mapping(address => uint) public balanceof;
    mapping(address => mapping(address => uint)) public allowance;
    string public bame = "MBECoin";
    string public symbol = "MBD";
    uint8 public decimals = 18;

    constructor()
    {
        balanceof[msg.sender] = totalSupply;
    }

    function transfer(address recipient,uint amount) external returns (bool)
    {
        balanceof[msg.sender] = balanceof[msg.sender]-amount;
        balanceof[recipient] = balanceof[recipient]+amount;
        emit Tranfer(msg.sender,recipient,amount);
        return true;
    }

    function approve(address spender, uint amount) external returns (bool)
    {
        allowance[msg.sender][spender] = amount;
        emit Approval(msg.sender,spender,amount);
        return true;
    }

    function transferFrom(
        address sender,
        address recipient,
        uint amount
        ) external returns (bool)
    {
        allowance[sender][msg.sender] = allowance[sender][msg.sender] - amount;
        balanceof[sender] = balanceof[sender] - amount;
        balanceof[recipient] = balanceof[recipient] + amount;
        emit Transfer(sender,recipient,amount);
        return true;
    }

    function mint(uint amount) external 
    {
        balanceof[msg.sender] = balanceof[msg.sender] + amount;
        totalSupply = totalSupplyl + amount;
        emit Transfer(address(0), msg.sender, amount);
    }

    function burn(uint amount) external 
    {
        balanceof[msg.sender] = balanceof[msg.sender] - amount;
        totalSupply = totalSupplyl - amount;
        emit Transfer(address(0), msg.sender, amount);
    }
}