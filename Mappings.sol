// SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

contract MappingsExample
{
    // Mapping from address to uint used to store balance oF addresses
    mapping(address => uint) public balances;

    // nested mapping from address to address to bool
    // used to store if first address is a friend of secod address
    mapping(address => mapping(address => bool)) public isFriend;

    function MappingAddress() external
    {
        // Insert
        balances[msg.sender] = 10000;
        //Read
        uint mybal = balances[msg.sender];
        // Update
        balances[msg.sender] +=20000;
        //Delete
        delete balances[msg.sender];

        //msg.sender is a friend of this contract
        isFriend[msg.sender][address(this)] = true;
    }

    function get(address _addr) external view returns (uint)
    {
        return balances[_addr];
    }

    function set(address _addr,uint _val) external 
    {
        balances[_addr] = _val;
    }

    function remove(address _addr) external 
    {
        delete balances[_addr];
    }
}