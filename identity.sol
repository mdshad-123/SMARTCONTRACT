// SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

contract Identity {
    string name;
    uint age;
 
 constructor() public 
 {
    name='shad';
    age=20;
 }
 function getName() view public returns(string memory)
 {
    return name;
 }
  function getage() view public returns(uint)
 {
    return age;
 }
}