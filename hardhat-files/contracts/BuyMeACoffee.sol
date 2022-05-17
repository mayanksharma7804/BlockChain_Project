//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract BuyMeACoffee {
    // Define the event to emit everytime a donation is done.
    event NewMemo(
        address indexed from,
        uint256 timestamp,
        string name,
        string message
    );

    // Define a Memo struct.
    struct Memo {
        address from;
        uint256 timestamp;
        string name;
        string message;
    }

    // Define the address of the contract deployer.
    // Mark it as payable to withdraw funds to this address.
    address payable owner;

    // Define an array to store all memos received from funders.
    Memo[] memos;

    constructor() {
        // When the smart contract is deployed this constructor saves
        // the address of the deployer into the owner variable as a payable address.
        // The owner address is payable to withdraw funds here.
        owner = payable(msg.sender);
    }

    // Define a function to show the memorized memos for every donation.
    function getMemos() public view returns (Memo[] memory) {
        return memos;
    }

    /* Define the function buyCoffee for the donations that accepts two strings:
    _name = name of the funder
    _message = a nice message from the funder
     */
    function buyCoffee(string memory _name, string memory _message)
        public
        payable
    {
        // Must accept more than 0 ETH for a coffee.
        require(msg.value > 0, "Can't buy coffee for free! :)");

        // Push the memo created to storage!
        memos.push(Memo(msg.sender, block.timestamp, _name, _message));

        // Emit a NewMemo event with details about the memo.
        emit NewMemo(msg.sender, block.timestamp, _name, _message);
    }

    // Define the function to send the entire balance stored
    // in this contract to the owner.
    function withdrawTips() public {
        require(owner.send(address(this).balance));
    }
}
