//SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;
import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import {base64} from "@openzeppelin/contracts/utils/Base64.sol";

contract MoodNft is ERC721 {
   uint256 public s_tokenCounter;
   string private s_sadSvgImageUri;
   string private s_happySvgImageUri;

   // string public constant BASE_URI =
        "ipfs://bafybeig37ioir76s7mg5oobetncojcm3c3hxasyd4rvid4jqhy4gkaheg4/?filename=";

    constructor( string memory sadSvgImageUri, string memory happySvgImageUri) ERC721("MoodNft", "MNFT") {
        s_tokenCounter = 0;
        s_sadSvgImageUri = sadSvgImageUri;
        s_happySvgImageUri = happySvgImageUri;
    }

    function mintNft(string memory tokenUri) public {
        _safeMint(msg.sender, s_tokenCounter);
        s_tokenCounter++;
    }

    function tokenURI(uint256 tokenId) public view override returns(string memory){
        string memory tokenMetadata = string.concat('{"name": "',name(),"'}');
    }


}
