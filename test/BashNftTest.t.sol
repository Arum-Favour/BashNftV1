// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;
import {Test} from "forge-std/Test.sol";
import {DeployBashNft} from "../script/DeployBashNft.s.sol";
import {BashNft} from "../src/BashNft.sol";

contract BashNftTest is Test {
    BashNft public bashNft;
    DeployBashNft public deployer;
    address public USER = makeAddr("user");
    string public constant PUG =
        "ipfs://bafybeig37ioir76s7mg5oobetncojcm3c3hxasyd4rvid4jqhy4gkaheg4/?filename=0-PUG.json";

    function setUp() public {
        deployer = new DeployBashNft();
        bashNft = deployer.run();
    }

    function testNameIsCorrect() public view {
        string memory expectedName = "Bash";
        string memory actualName = bashNft.name();
        assert(
            keccak256(abi.encodePacked(expectedName)) ==
                keccak256(abi.encodePacked(actualName))
        );
    }
    function testCanMintAnsHaveABalance() public {
        vm.prank(USER);
        bashNft.mintNft(PUG);
        assert(bashNft.balanceOf(USER) == 1);
        assert(
            keccak256(abi.encodePacked(bashNft.tokenURI(0))) ==
                keccak256(abi.encodePacked(PUG))
        );
    }
}
