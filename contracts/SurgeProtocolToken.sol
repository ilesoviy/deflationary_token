// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

// Network: Ethereum
// Name: SurgeProtocol
// Token: SRG
// TotalSupply: 1.5 billion

contract SurgeProtocolToken is ERC20, Ownable {
    uint256 public txFee;
    address public taxWallet;
    mapping(address => bool) whitelists;

    constructor(uint256 txFee_, address taxWallet_) ERC20("SurgeProtocol", "SRG") {
        txFee = txFee_;
        taxWallet = taxWallet_;
        _mint(msg.sender, 15 * 10**8 * 10 ** decimals());
    }

    function transfer(
        address to,
        uint256 amount
    ) public virtual override returns (bool) {
        if (whitelists[to] == false) {
            uint256 taxValue = (amount / 100) * txFee;
            _transfer(msg.sender, taxWallet, taxValue);
            _transfer(msg.sender, to, amount - taxValue);
        }
        else
            _transfer(msg.sender, to, amount);
        
        return true;
    }

    function transferFrom(
        address from,
        address to,
        uint256 amount
    ) public virtual override returns (bool) {
        address spender = _msgSender();
        
        if (whitelists[from] == false && whitelists[to] == false) {
            uint256 taxValue = (amount / 100) * txFee;
            _transfer(from, taxWallet, taxValue);
            _spendAllowance(from, spender, amount);
            _transfer(from, to, amount - taxValue);
            return true;
        }
        else {
            _spendAllowance(from, spender, amount);
            _transfer(from, to, amount);
            return true;
        }
    }

    function changeFee(uint256 txFee_) external onlyOwner {
        txFee = txFee_;
    }

    function changeTaxWallet(address taxWallet_) external onlyOwner {
        taxWallet = taxWallet_;
    }

    function enableWhitelist(address whitelist_) external onlyOwner {
        whitelists[whitelist_] = true;
    }

    function disableWhitelist(address blacklist_) external onlyOwner {
        whitelists[blacklist_] = false;
    }
}
