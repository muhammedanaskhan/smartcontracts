// SPDX-License-Identifier: MIT

pragma solidity ^0.8.26;

contract FundMe {

    address payable public owner;

    constructor() {
        owner = payable(msg.sender);
    }

    function fund() public payable {
        require(msg.value > 1e18, "Minimum 1 ETH required");      //   1e18 => 1ETH 
    }

    function withdraw() public {
        require(msg.sender == owner, "Only owner can access funds");
        require(address(this).balance > 0 , "Contract has no funds");

        owner.transfer(address(this).balance);
    }
}
 