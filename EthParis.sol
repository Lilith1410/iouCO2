pragma solidity ^0.4.24;

contract ConsumerInterface {
    uint256 public carbon;
}

contract EthParis {
	address recipient; 
	address owner; 
    
	// 350.org donation address: 
	// 0x50990F09d4f0cb864b8e046e7edC749dE410916b
	
	// constructor
	constructor() public {
		owner = msg.sender; 
		recipient = 0x50990F09d4f0cb864b8e046e7edC749dE410916b; 
	}

	// fallback function
	function () external payable {}

	// donating
	function donate() public payable {
	    if(recipient == address(0)) {
	        msg.sender.transfer(msg.value); 
	    }
	    recipient.transfer(msg.value);
	}

	// optional + Setters
	function setRecipient(address _recipient) public {
		if(msg.sender == owner) {
			recipient = _recipient; 
		}
	}
	
	// Getter
	function getRecipient() public view returns (address) {
	    return recipient; 
	}
	
	function getCarbon() public view returns (uint256) {
	    return ConsumerInterface(0x75c1B8d6eBaAd527Cf4bF43dE2C7911250d9f8F1).carbon();
	}
	
	function getOwner() public view returns (address) {
	    return owner; 
	}
}