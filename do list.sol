// SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

contract TodoList
{
    struct ToDo
    {
        string username;
        bool compeleted;
    }

    ToDo[] public Tasks;

    function CreatUser(string calldata _username) external 
    {
        Tasks.push(ToDo(
            {
                username: _username,
                completed: false
            }
        ));
    }

    function UpdateUser(uint _index, string memory _username) external 
    {
        ToDo storage NewTasks = Tasks[_index];
        NewTasks.username = _username;
    }

    function ToggleCompleted(uint _index) external 
    {
        ToDo storage NewTaska = Tasks[_index];
        NewTasks.completed = !NewTasks.completed;
    }

    function getUserTaskinfo(uint _index) external view returns (string memory, bool)
    {
        ToDo storage NewTasks = Tasks[_index];
        return (NewTasks.username,NewTasks.completed);
    }
}