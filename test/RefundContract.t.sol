// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity ^0.8.19;

import "@forge-std/Test.sol";
import "@openzeppelin/utils/Address.sol";
import "../src/RefundContract.sol";

contract RefundContractTest is Test {
    address constant TEST_SENDER = 0xef32d025f00Eb2f34c2ba47854620482140c2549;

    RefundContract refundContract;

    function setUp() public {
        refundContract = new RefundContract();
    }

    function test1() public {
        vm.deal(TEST_SENDER, 1 ether);
        vm.prank(TEST_SENDER);
        (bool success, ) = address(refundContract).call{value: 1 ether}("");

        assertEq(success, true);
        assertEq(TEST_SENDER.balance, 1 ether);
    }

}