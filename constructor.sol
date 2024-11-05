// SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

contract ConstructorExample
{
    address public MyownersAddress;
    uint public number;
    string public Myname;

    constructor(string memory _Myname,uint _number)
    {
        MyownersAddress = msg.sender;
        Myname = _Myname;
        number = _number;
    }
}