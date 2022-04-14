//SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "./ERC721Stripped.sol";

contract GMITeamNFTs is ERC721 {
    using Address for address;

    // needs to be unlocked for the mint function to work
    bool locked = false;

    // Contract Creation
    constructor(string memory newBaseURI) ERC721("Iguana Gang", "XXX") { 
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
            _mint(addressUser[i], _amount);
        }
    }   
}