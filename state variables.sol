// SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

contract StateVariables
{
    uint public mynumber;
    function setMynumber(uint _mynumber) external 
    {
        mynumber = _mynumber;
    }
    function restMynumber() external 
    {
        mynumber=0;
    }
    function getmynumber() external view returns (uint)
    {
        return mynumber;
    }
    function getMynumberplusone() external view returns (uint)
    {
        return mynumber + 1;
    }
}