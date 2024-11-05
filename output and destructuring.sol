// SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

contract FunctionOutputs
{
    //Function can return multiple outputs.
    function returnManyOutputs() public pure returns(uint, bool)
    {
        return(1,true);
    }

    // Output can be named.
    function namedOutput() public pure returns(uint number, bool Myboolstatus)
    {
        return(1,true);
    }

    //Outputs can be assigned to their name.
    //Here return statement can be omitted.
    function AssignedOutput() public pure returns(uint number, bool Myboolstatus)
    {
        number=1;
        Myboolstatus=true;
    }

    //use Destructuring assignment when calling another
    // funnction that returns multiple outputs.
    function DestructuringAssignements() public pure 
    {
        (uint number, bool Myboolstatus)=returnManyOutputs();
        //Outputs can be left out.
        (,bool Myanotherboolstatus) = returnManyOutputs();
    }

    function Samplefunction() external view returns(address,bool)
    {
        return ( msg.sender,true);
    }

}