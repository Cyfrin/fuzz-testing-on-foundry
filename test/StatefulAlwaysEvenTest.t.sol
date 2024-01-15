// SPDX-License-Identifier: MIT

import {Test} from "forge-std/Test.sol";
import {AlwaysEven} from "../src/AlwaysEven.sol";

// We need to import the invariant contract from forge-std
import {StdInvariant} from "forge-std/StdInvariant.sol";

pragma solidity ^0.8.12;

contract AlwaysEvenTestStateful is StdInvariant, Test {
    AlwaysEven alwaysEven;

    function setUp() public {
        alwaysEven = new AlwaysEven();
        // we must define the target contract which is going to start executing the functions with random inputs
        targetContract(address(alwaysEven));
    }

    function invariant_testsetEvenNumber() public view {
        assert(alwaysEven.alwaysEvenNumber() % 2 == 0);
    }
}
