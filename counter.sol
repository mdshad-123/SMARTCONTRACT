// SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

contract Counter
{
    uint public count;

    function Increement() external 
    {
        count += 1;
    }
    function Decrement() external 
    {
        count -= 1;
    }
}