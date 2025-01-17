// SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

contract Error {
    function testRequire(uint _i) public pure {
        // Require should be used to vailed conditions such as:
        // - inputs
        // - conditions before execution
        // - return values from calls to other functions
        require(_i > 10, "Input must be greater than 10");
    }
    function testRevert(uint _i) public pure {
        // Revert is useful when the conditin to check is complex.
        // This code does the exact same thing as the example above
        if (_i <= 10) {
            revert("Input must be grater than 10");
        }
    }

    uint public num;

    function testAssert() public view {
        //Assert should only be used to test for internal errors,
        // and to check invariants.

        // Here we assert that num is always equal to 0
        // since it is impossible to update the value of num
        assert(num == 1);
    }

    // custom error
    error InsufficientBalance(uint Balance, uint withdrawAmount);

    function testCustomError(uint _withdrawAmount) public view {
        uint bal = 100000;
        if (bal < _withdrawAmount) {
            revert InsufficientBalance({balance: bal, withdrawAmount: _withdrawAmount});
        }
    }
}