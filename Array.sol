// SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

contract ArraysExample
{
    // Several ways to initialize an array
    uint[] public myfirstarray;
    uint[] public mysecondarray = [1,2,3];
    // Fixed sized array, all elements inititalize to 0
    uint[3] public FixedSizeArray;

    // Insert, read, update and delete
    function OperationsonArrays() external 
    {
        // insert - add new elemnent to end of array
        myfirstarray.push(1);
        //Read
          uint firstelement = myfirstarray[0];
        //Update
        myfirstarray[0] = 123;
          uint updatedelement = myfirstarray[0];

        // Delete does not change the array length.
        // It resets the value at index to it's default vlaue, in this case 0.
        delete myfirstarray[0];
        //Get length of array
          uint myarraylength = myfirstarray.length;

        //push inserts an element into array.
        myfirstarray.push(10);
        myfirstarray.push(20);

        //pop removes last element.
        //20 is removed
        myfirstarray.pop();

        // Flxed size array can be created in memory
        uint[] memory a = new uint[](3);
        //push and pop are not available
        //a.push(1);
        //a.pop(1);
        a[0] = 1;
    }

    function get(uint elements) external view returns (uint)
    {
        return myfirstarray[elements];
    }
    function push (uint Newelement) external 
    {
        myfirstarray.push(Newelement);
    }
    function remove(uint DeleteElement) external 
    {
        delete myfirstarray[DeleteElement];
    }

    function getlength() external view returns(uint)
    {
        return myfirstarray.length;
    }
}