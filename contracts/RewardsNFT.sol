// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract RewardsNFT is ERC721URIStorage, Ownable {
    uint256 private _tokenIdCounter = 0;

    constructor(string memory name, string memory symbol) ERC721(name, symbol) {}

    function mintWithURI(address to, string memory tokenURI) public onlyOwner {
        uint256 newTokenId = _tokenIdCounter;
        _mint(to, newTokenId);
        _setTokenURI(newTokenId, tokenURI);
        _tokenIdCounter++;
    }

    function getTokenIdCounter() public view returns (uint256) {
        return _tokenIdCounter;
    }
}