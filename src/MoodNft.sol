//SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;
import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract MoodNft is ERC721 {
   uint256 public tokenCounter;
   string private s_sadSvg;
   string private s_happySvg;

   // string public constant BASE_URI =
        "ipfs://bafybeig37ioir76s7mg5oobetncojcm3c3hxasyd4rvid4jqhy4gkaheg4/?filename=";

    constructor( string memory sadSvg, string memory happySvg) ERC721("MoodNft", "MNFT") {
        tokenCounter = 0;
        s_sadSvg = sadSvg;
        s_happySvg = happySvg;
    }

    function mintNft(string memory tokenUri) public {
        _safeMint(msg.sender, tokenCounter);
        _setTokenURI(tokenCounter, tokenUri);
        tokenCounter++;
    }
}
