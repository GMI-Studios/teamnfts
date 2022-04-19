//SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

/// @title Custom 721s for GMIStudios
/// @author @kmao37 @gmistudios 
/// @notice NFTs are not meant to be traded & will be locked after minting
/// @dev These 721s are not meant to be tradeable 
contract GMITeamNFTs is ERC721, Ownable {

    string public baseURI = "";
    bool public tradingAllowed = true;


    // Contract Creation
    constructor()ERC721("GMI Team NFTs", "GMI") { 
    }      

    /// @notice Mints _amount number of NFTs to an array of addresses
    /// @param _amount number of NFTs to mint
    /// @param addressUser array of addresses to mint to    
    function mintMultipleToUser(uint256 _amount, address[] memory addressUser) external onlyOwner {
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

    /// @dev this overrides the default function with 721, that runs before a token transfer
    /// is initiated (including burns)
    function _beforeTokenTransfer(
        address from,
        address to,
        uint256 tokenId
    ) internal virtual override {
        require(tradingAllowed == true);
    }    

    /// @notice this is used to lock trading
    /// @dev this is done by inputing an additional check in _beforeTokenTransfers
    function lockTrading() external onlyOwner {
        tradingAllowed = !tradingAllowed;
    }

    
}