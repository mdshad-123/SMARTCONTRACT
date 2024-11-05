// SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

contract ErrorHandling
{
    function testRequire(uint _number1,uint _number2) external pure 
    {
        require(_number1 >= _number2,"if Number1 is greater than Number2 then revert the tramsaction to the initial state");
    }
}