//SPDX-License-Identifier: Unlicensed

pragma solidity 0.8.4;

contract MultiSend {
    mapping(address => uint256) public savings;

    //@notice sends ether into the contracts
    function depositToAcc() payable external returns(uint256 deposit) {
        require(msg.value > 1 ether, "Send more than 1 ethers.");
        savings[msg.sender] = msg.value;
        return msg.value;
    } 

    //@notice multisend the ethers to various address passed as receivers.
    //@param _amount This is the amount of ethers to be distributed equally among addresses.
    //@param receivers The addresses to receive the ethers
    function Multisend(uint256 _amount, address[] memory receivers) external payable returns(bool _success) {
        require(_amount > 1 ether, "Must transfer more than an ether.");
        require(_amount <= savings[msg.sender], "Insufficient funds.");
        uint256 bal = savings[msg.sender];
        savings[msg.sender] = bal - _amount;
        for(uint8 i = 0; i < receivers.length; i ++) {
            (bool success, ) = receivers[i].call{value: _amount/receivers.length}('');
            _success = success;
        }
    }