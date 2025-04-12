// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;
import {Test} from "forge-std/Test.sol";
import {DeployBashNft} from "../script/DeployBashNft.s.sol";
import {BashNft} from "../src/BashNft.sol";

contract BashNftTest is Test {
    BashNft public bashNft;
    DeployBashNft public deployer;

    function setUp() {
        deployer = new DeployBashNft();
        bashNft = deployer.run();
    }

    function testNameIsCorrect() public {
        string memory expectedName = "Bash";
        string memory actualName = bashNft.name();
        assert(
            keccak256(abi.encodePacked(expectedName)) ==
                keccak256(abi.encodePacked(actualName))
        );
    }
}
