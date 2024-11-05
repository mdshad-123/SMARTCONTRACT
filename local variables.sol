// SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

contract LocalVariables
{
    // these are state variables.
    uint public firstvariable;
    bool public secondvariable;
    address public myAddress;

    function localvariables() external
    {  
        // localvariables are not saved to blockchain.
        // these are local variables
        uint Mynumber=123;
        bool Myboolean=false;

        Mynumber=Mynumber+123;
        Myboolean=true;

        firstvariable=123;
        secondvariable=true;
        myAddress=address(1);
    }
}