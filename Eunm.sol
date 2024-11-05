// SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

contract StatusoftheOrder
{
    enum Status
    {
        None,
        Pendding,
        Shipped,
        Completed,
        Rejected,
        Canceled
    }

    Status public status;

    function get() external view returns (Status)
    {
        return status;
    }

    function set(Status _status) external 
    {
        status = _status;
    }
    function cancel() external 
    {
        status = Status.Canceled;
    }
    function reject() external 
    {
        status = Status.Rejected;
    }

    function shipping() external 
    {
        status = Status.Shipped;
    }

    function reset() public 
    {
        delete status;
    }
}