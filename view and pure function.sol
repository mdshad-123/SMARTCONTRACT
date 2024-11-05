// SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

contract ViewandPureFunctions
{
    uint public number1; // This is a state variable

    function Viewfunction() external view returns(uint)  // This is view function so it can read state variable
    {
        return number1;
    }
    function Purefunction() external pure returns(uint) // This is pure function so it cannot read state variable
    {
        return 100;
    }
    function addtoNumber1(uint number2) external view returns(uint)
    {
        return number1 + number2;
    }
    function add(uint num1,uint num2) external pure returns(uint)
    {
        return num1+num2;
    }
}