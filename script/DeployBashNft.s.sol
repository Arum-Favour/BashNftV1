// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;
import {Script} from "forge-std/Script.sol";
import {BashNft} from "../src/BashNft.sol";

contract DeployBashNft is Script {
    function run() external returns (BashNft) {
        vm.startBroadcast();
        BashNft bashNft = new BashNft();
        vm.stopBroadcast();
        return bashNft;
    }
}
