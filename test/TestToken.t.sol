// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console2} from "forge-std/Test.sol";
import {TokenContract} from "../src/TokenContract.sol";
import {LoadKey} from "./base/loadKey.t.sol";

contract CounterTest is LoadKey {
    TokenContract public tokenContract;

    // bytes memory code = address(awesomeContract).code;
    address pancakeRouter = makeAddr("pancakeRouter");
    // vm.etch(targetAddr, code);
    // log_bytes(address(targetAddr).code);

    address owner_ = makeAddr("owner");

struct TokenInfo {
		string name;
		string symbol;
		address marketingFeeReceiver;
		address devFeeReceiver;
		uint256 marketingTaxBuy;
		uint256 marketingTaxSell;
		uint256 devTaxSell;
		uint256 devTaxBuy;
		uint256 lpTaxBuy;
		uint256 lpTaxSell;
		uint256 totalSupply;
		uint256 maxPercentageForWallet;
		uint256 maxPercentageForTx;
		address swapRouter;
		address newOwner;
	}

    function setUp() public virtual override {
        super.setUp();

        //tokenContract = new tokenContract

        string memory name = "tokenName";
		string memory symbol = "tokenSymbol";
		address marketingFeeReceiver = makeAddr("");
		address devFeeReceiver = makeAddr("");
		uint256 marketingTaxBuy = 5 ether;
		uint256 marketingTaxSell = 5 ether;
		uint256 devTaxSell = 5 ether;
		uint256 devTaxBuy = 5 ether;
		uint256 lpTaxBuy = 5 ether;
		uint256 lpTaxSell = 5 ether;
		uint256 totalSupply = 10**9 * 10**18;
		uint256 maxPercentageForWallet = 10 ether;
		uint256 maxPercentageForTx = 10 ether;
		address swapRouter = pancakeRouter;
		address newOwner = msg.sender;

        
		TokenContract.TokenInfo memory tokenInfo = TokenContract.TokenInfo(
                name,
                symbol,
                marketingFeeReceiver,
                devFeeReceiver,
                marketingTaxBuy,
                marketingTaxSell,
                devTaxSell,
                devTaxBuy,
                lpTaxBuy,
                lpTaxSell,
                totalSupply,
                maxPercentageForWallet,
                maxPercentageForTx,
                swapRouter,
                newOwner
            );
		uint256 deployerTax = 0;
        address deployer = owner_;


        tokenContract = new TokenContract(
            tokenInfo,
            deployerTax,
            deployer
        );
    }


}
