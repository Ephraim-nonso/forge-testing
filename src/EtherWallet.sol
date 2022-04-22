//SPDX-License-Identifer: UNLICENSED

pragma solidity 0.8.6;
error InsufficientFunds();

contract EtherWallet {

    mapping(address => uint256) private wallets;
    

    function deposit() payable external {
        wallets[msg.sender] = wallets[msg.sender] + msg.value;
    }

    function withdraw(uint256 _amount) external returns(bool success) {
        if(_amount > wallets[msg.sender]) revert InsufficientFunds();
        wallets[msg.sender] = wallets[msg.sender] - _amount;
        success = msg.sender.call{value: _amount}("");
    }

    function checkBalance() external view returns(uint256 val) {
        val = wallets[msg.sender];
    }

    function walletBalance() external view returns(uint256 val) {
        val = address(this).balance;
    }
}