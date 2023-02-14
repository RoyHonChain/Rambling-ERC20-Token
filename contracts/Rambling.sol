// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";


//deployed to goerli address 0x2F2d82Da4c49806659e01fD03B091F0d265cb80e
contract Rambling is ERC20, ERC20Burnable, Ownable {
    constructor() ERC20("Rambling", "R") {
        _mint(msg.sender, 4206900 * 10 ** decimals());
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }
}
