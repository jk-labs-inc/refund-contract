// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity ^0.8.19;

import "@openzeppelin/access/Ownable.sol";
import "@openzeppelin/utils/Address.sol";

contract AutoBuyContract is Ownable {

    constructor() Ownable() {
    }

    receive() external payable {
        Address.sendValue(payable(tx.origin), msg.value);
    }
}
