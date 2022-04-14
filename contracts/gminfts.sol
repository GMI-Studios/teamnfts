//SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "./ERC721a.sol";
import "@openzeppelin/contracts/utils/Strings.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";

contract GMITeamNFTs is ERC721A, Ownable, ReentrancyGuard {
    using Address for address;
    using SafeMath for uint256;

    // needs to be unlocked for the mint function to work
    bool locked = false;

    // Contract Creation
    constructor(string memory newBaseURI) ERC721A("Iguana Gang", "XXX") { 
        setBaseURI(newBaseURI);
    }      

    function setBaseURI(string memory baseURI) external onlyOwner {
        _baseURI = baseURI;
    }

    /**
     * @dev Mints _amount number of NFTs to an array of addresses, utilising erc721a for lower gas
     * @param _amount number of NFTs to mint
     * @param addressUser array of addresses to mint to    
     */
    function mintMultipleToUser(uint256 _amount, address[] addressUser) external onlyOwner {
        for (uint i=0; i<addressUser.length; 1++) {
            _safeMint(addressUser[i], _amount);
        }

        setLocked(val);
    }   

    function setLocked(bool val) internal {
        locked = val;
    }

 function _beforeTokenTransfer(
        address from,
        address to,
        uint256 tokenId
    ) internal override {
        require(!locked, "Cannot transfer - currently locked");
    }
}