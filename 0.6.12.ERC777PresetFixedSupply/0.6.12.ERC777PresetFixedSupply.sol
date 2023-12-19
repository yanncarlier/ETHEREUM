// SPDX-License-Identifier: MIT
pragma solidity ^0.6.2;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v3.3.0/contracts/token/ERC777/ERC777.sol";

/**
 * @title ERC777 Preset FixedSupply MMN Token
 * @author openzeppelin, MM Network
 */
contract MMN is ERC777 {
    constructor () public ERC777("ERC777 Preset FixedSupply MMN Token", "MMN", new address[](0)) {
        _mint(msg.sender, 115792089237316195423570985008687907853269984665640564039457584007913129639935, "", "");
    }
}