//SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;


import "@openzeppelin/contracts/token/ERC721/IERC721.sol";

contract GMITeamNFTs is IERC721 {



    // // needs to be unlocked for the mint function to work
    // bool locked = false;

    // // Contract Creation
    // constructor(string memory newBaseURI)  { 
    //     _baseURI = newBaseURI;
    // }      

    // function setBaseURI(string memory baseURI) external onlyOwner {
    //     _baseURI = baseURI;
    // }

    // /**
    //  * @dev Mints _amount number of NFTs to an array of addresses, utilising erc721a for lower gas
    //  * @param _amount number of NFTs to mint
    //  * @param addressUser array of addresses to mint to    
    //  */
    // function mintMultipleToUser(uint256 _amount, address[] addressUser) external onlyOwner {
    //     for (uint i=0; i<addressUser.length; 1++) {
    //         _mint(addressUser[i], _amount);
    //     }
    // }   
}