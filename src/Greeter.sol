// SPDX-License-Identifier: ISC
pragma solidity ^0.8.11;

import {console} from "./test/utils/Console.sol";

/// @dev Thrown when trying to set the greeting with zero length.
error GreeterZeroLengthGreeting();

/// @title Simple greeter smart contract
/// @author Shantin Kirill <KShantin@competentIT.dev>
contract Greeter {
    string private greeting;

    /// @dev Emitted when the greeting is changed.
    /// @param greeting Previous greeting.
    /// @param newGreeting New greeting.
    event GreetingChanged(string greeting, string newGreeting);

    constructor(string memory _greeting) {
        // solhint-disable-next-line
        console.log("Deploying a Greeter with greeting '%s'", _greeting);
        greeting = _greeting;
    }

    function setGreeting(string memory _greeting) external {
        if (bytes(_greeting).length == 0) {
            revert GreeterZeroLengthGreeting();
        }
        // solhint-disable-next-line
        console.log("Changing greeting from '%s' to '%s'", greeting, _greeting);
        emit GreetingChanged(greeting, _greeting);
        greeting = _greeting;
    }

    function greet() external view returns (string memory) {
        return greeting;
    }
}
