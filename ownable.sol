// SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

contract Ownable {
    address public owner;


//Restrict the function calls only to the current owner.
modifier onlyOwner() {
    require(msg.sender == owner, "you are not the owner of this Smart Contract");
    _;
}

//This function can only be called by the current owner only.
function setOwner(address _newOwner) external onlyOwner {
    //New owner cannot be assigned to the Zero address.
    require(_newOwner != address(0),"The new Owner cannot be assigned to a Zero address");
    owner = _newOwner;
   }
}

//0x358AA13c52544ECCEF6B0ADD0f801012ADAD5eE3==msg.sender
//0x5B38Da6a701c568545dCfcB03FcB875f56beddC4==owner
//0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2==newowner