//SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

/// @title Custom 721s for GMIStudios
/// @author @kmao37 @gmistudios 
/// @notice NFTs are not meant to be traded & will be locked after minting
/// @dev These 721s are not meant to be tradeable 
contract GMITeamNFTs is ERC721, Ownable {

    string public baseURI = "";

    // Contract Creation
    constructor()ERC721("GMI Team NFTs", "GMI") { 
    }      

    /// @notice Mints _amount number of NFTs to an array of addresses
    /// @param _amount number of NFTs to mint
    /// @param addressUser array of addresses to mint to    
    function mintMultipleToUser(uint256 _amount, address[] addressUser) external onlyOwner {
        for (uint i=0; i<addressUser.length; i++) {
            _mint(addressUser[i], _amount);
        }
    }   

    function _baseURI() internal view virtual override returns (string memory) {
		return baseURI;
	}

	function setBaseURI(string calldata _uri) external onlyOwner{
		baseURI = _uri;
	}

    // we don't actually need this, this is for more aesthetic purposes
    function _startTokenId() internal view virtual override returns (uint256) {
        return 1;
    }

    

}