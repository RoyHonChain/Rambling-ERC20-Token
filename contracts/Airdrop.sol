// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts@4.8.1/token/ERC20/ERC20.sol";


//deployed to goerli address: 0x7d42973D25c3ECF48075c9E8881b4424148e38B4
contract Airdrop {
    address public owner;
    address public tokenAddr;
    uint256 public airdropAmount;

    constructor(address _tokenAddr,uint256 _airdropAmount) {
        owner=msg.sender;
        tokenAddr=_tokenAddr;
        airdropAmount=_airdropAmount;
    }

    function airdrop() public {
        require(getPoolBalance()>=airdropAmount,"Dont have more..." );
        ERC20(tokenAddr).transfer(msg.sender,airdropAmount);
    }

    function getPoolBalance() public view returns(uint256){
        return ERC20(tokenAddr).balanceOf(address(this));
    }

    function withdrawPool(address _to) public onlyOwner{
        ERC20(tokenAddr).transfer(_to,getPoolBalance());
    }

    function transferOwnership(address _to) public onlyOwner{
        owner=_to;
    }

    function changeAirdropAmount(uint256 _amount) public onlyOwner{
        airdropAmount=_amount;
    }

    function changeAirdropToken(address _tokenAddr) public onlyOwner{
        tokenAddr=_tokenAddr;
    }

    modifier onlyOwner{
        require(msg.sender==owner,"you should not pass");
        _;
    }

}
