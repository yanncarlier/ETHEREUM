// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

contract GameOfSecrets {
    address owner;
    mapping(address => bytes32) public secrets;

    constructor() {
        owner = msg.sender;
    }

    function setSecret(bytes32 _secret) external {
        require(secrets[msg.sender] == bytes32(0), "This address was alredy used"); // Unplayed move
        secrets[msg.sender] = keccak256(abi.encodePacked(msg.sender, _secret));
    }
    
    function evaluate(address _address, bytes32 _secret) external view returns (address) {
        require(keccak256(abi.encodePacked(msg.sender, _secret)) == secrets[_address]);
            // return address(0);
            return _address;
    }

    function withdraw(address payable _to, uint _amount) public {
        require(msg.sender == owner);
        _to.transfer(_amount);
    }

    receive() external payable {}

}

// ROCK bytes32: 0x524f434b00000000000000000000000000000000000000000000000000000000