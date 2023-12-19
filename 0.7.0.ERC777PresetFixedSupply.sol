// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v3.4.0/contracts/token/ERC777/ERC777.sol";

contract MYM is ERC777 {

    constructor () ERC777("ERC777 Preset FixedSupply MYM Token", "MYM", new address[](0)) {
        _mint(msg.sender, 115792089237316195423570985008687907853269984665640564039457584007913129639935, "", "");
    }

} 