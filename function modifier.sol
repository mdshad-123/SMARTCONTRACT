// SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

contract FunctionModifier
{
    bool public functionispaused;
    uint public count;

    modifier whenfunctionisNotPaused()
    {
        require(!functionispaused,"you cannot modify when it is paused");
        _;
    }

    function setPause(bool _functionispaused) external 
    {
        functionispaused = _functionispaused;
    }

    function Increment() external whenfunctionisNotPaused
    {
        count = count + 1;
    }

    function Decrement() external whenfunctionisNotPaused
    {
        count = count - 1;
    }

    modifier whenfunctionispaused()
    {
        require(!functionispaused,"you can modify when it is not paused");
        _;
    }

    function reset() external whenfunctionispaused
    {
        count = 0;
    }

    modifier check (uint _number1)
    {
        require(_number1 < 10, "Number1 must be less than or equal to 10");
        _;
    }

    function IncrementbyNumber(uint _number1) external whenfunctionisNotPaused check(_number1)
    {
        count = count + _number1;
    }
}