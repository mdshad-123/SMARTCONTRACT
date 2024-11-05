// SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

contract MBDBank
{
    mapping(address => uint) balance;

    function getBalance() public view returns (uint)
    {
        return balance[msg.sender];
    }

    function deposite() public payable 
    {
        balance[msg.sender] = balance[msg.sender] + msg.value;
    }

    function withdraw(uint _amount) public 
    {
        balance[msg.sender] = balance[msg.sender] - _amount;
        payable(msg.sender).transfer(_amount);
    }

    function transfer(address _to, uint _amount) public
    {
        balance[msg.sender] = balance[msg.sender] - _amount;
        balance[_to] = balance[_to] + _amount;
    }
}