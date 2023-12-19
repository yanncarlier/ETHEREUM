// SPDX-License-Identifier: MIT
pragma solidity >=0.7.6 <0.8.0;

contract GameOfSecrets {
    address owner;
    // a list of players addresses having a minimum of .01 ether
    //address[] players;
    // a table of addresses mapped to a secret
    mapping(address => bytes32) public secrets;

    constructor() {
        owner = msg.sender;
    }
    
    // function setPlayer() public payable {
    //     require(msg.value >= .01 ether, "Value must be more or equal to .01 ether");
    //     players.push(msg.sender);
    // }

    // function getPlayers() public view returns(address[] memory) {
    //     return players;
    // }

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