// SPDX-License-Identifier: MIT
pragma solidity ^0.6.2;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v3.4.0/contracts/token/ERC777/ERC777.sol";

/**
 * @dev {ERC777} token, including:
 *
 *  - Preminted initial supply
 *  - No access control mechanism (for minting/pausing) and hence no governance
 *
 * _Available since v3.4._
 *
 * @title ERC777 Preset FixedSupply MYM Token
 * @author openzeppelin, MYM Network
 *
 */
contract MYM is ERC777 {

    constructor(
        string memory name,
        string memory symbol,
        address[] memory defaultOperators,
        uint256 initialSupply,
        address owner
    ) public ERC777(name, symbol, defaultOperators) {
        _mint(owner, initialSupply, "", "");
    }
}