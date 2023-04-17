// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.11;

import {DSTest} from "ds-test/test.sol";
import {Utilities} from "./utils/Utilities.sol";
import {console} from "./utils/Console.sol";
import {Vm} from "forge-std/Vm.sol";
import {Greeter} from "../Greeter.sol";

contract ContractTest is DSTest {
    Vm internal immutable vm = Vm(HEVM_ADDRESS);
    Greeter public greeter;
    Utilities internal utils;
    address payable[] internal users;

    function setUp() public {
        utils = new Utilities();
        users = utils.createUsers(5);
        greeter = new Greeter("Hello world!");
    }

    function testExample() public {
        address payable alice = users[0];
        // labels alice's address in call traces as "Alice [<address>]"
        vm.label(alice, "Alice");
        // solhint-disable-next-line
        console.log("alice's address", alice);
        address payable bob = users[1];
        vm.label(bob, "Bob");

        vm.prank(alice);
        (bool sent, ) = bob.call{value: 10 ether}("");
        assertTrue(sent);
        assertGt(bob.balance, alice.balance);
    }

    function testGreetingIsRight() public {
        greeter.setGreeting("Hi, I am fine!");
        assertEq(greeter.greet(), "Hi, I am fine!");
    }
}
