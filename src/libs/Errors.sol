// SPDX-License-Identifier: BUSL-1.1
pragma solidity <0.9.0;

/* solhint-disable max-line-length */
library CError {
    error DIAMOND_CALLDATA_IS_NOT_EMPTY();
    error ADDRESS_HAS_NO_CODE(address);
    error DIAMOND_INIT_ADDRESS_ZERO_BUT_CALLDATA_NOT_EMPTY();
    error DIAMOND_INIT_NOT_ZERO_BUT_CALLDATA_IS_EMPTY();
    error DIAMOND_INIT_HAS_NO_CODE();
    error DIAMOND_FUNCTION_ALREADY_EXISTS(address, address, bytes4);
    error DIAMOND_INIT_FAILED(address);
    error DIAMOND_INCORRECT_FACET_CUT_ACTION();
    error DIAMOND_REMOVE_FUNCTIONS_NONZERO_FACET_ADDRESS(address);
    error DIAMOND_NO_FACET_SELECTORS(address);
    error ETH_TRANSFER_FAILED(address, uint256);
    error TRANSFER_FAILED(address, address, address, uint256);
    error INVALID_SIGNER(address, address);
    error APPROVE_FAILED(address, address, address, uint256);
    error PERMIT_DEADLINE_EXPIRED(address, address, uint256, uint256);
    error SAFE_ERC20_PERMIT_ERC20_OPERATION_FAILED(address);
    error SAFE_ERC20_PERMIT_APPROVE_NON_ZERO(address, uint256, uint256);
    error DIAMOND_REMOVE_FUNCTION_FACET_IS_ZERO();
    error DIAMOND_REPLACE_FUNCTION_DUPLICATE();
    error STRING_HEX_LENGTH_INSUFFICIENT();
    error ALREADY_INITIALIZED();
    error SAFE_ERC20_PERMIT_DECREASE_BELOW_ZERO(address, uint256, uint256);
    error INVALID_SENDER(address, address);
    error NOT_OWNER(address who, address owner);
    error NOT_PENDING_OWNER(address who, address pendingOwner);
    error SEIZE_UNDERFLOW(uint256, uint256);
    error MARKET_CLOSED(address, string);
    error SCDP_ASSET_ECONOMY(
        address seizeAsset,
        uint256 seizeReductionPct,
        address repayAsset,
        uint256 repayIncreasePct
    );
    error MINTER_ASSET_ECONOMY(
        address seizeAsset,
        uint256 seizeReductionPct,
        address repayAsset,
        uint256 repayIncreasePct
    );
    error INVALID_ASSET(address asset);
    error DEBT_EXCEEDS_COLLATERAL(
        uint256 collateralValue,
        uint256 minCollateralValue,
        uint32 ratio
    );
    error DEPOSIT_LIMIT(address asset, uint256 deposits, uint256 limit);
    error INVALID_MIN_DEBT(uint256 invalid, uint256 valid);
    error INVALID_SCDP_FEE(address asset, uint256 invalid, uint256 valid);
    error INVALID_MCR(uint256 invalid, uint256 valid);
    error COLLATERAL_DOES_NOT_EXIST(address asset);
    error KRASSET_DOES_NOT_EXIST(address asset);
    error SAFETY_COUNCIL_NOT_ALLOWED();
    error NATIVE_TOKEN_DISABLED();
    error SAFETY_COUNCIL_INVALID_ADDRESS(address);
    error SAFETY_COUNCIL_ALREADY_EXISTS();
    error MULTISIG_NOT_ENOUGH_OWNERS(uint256 owners, uint256 required);
    error ACCESS_CONTROL_NOT_SELF(address who, address self);
    error INVALID_MLR(uint256 invalid, uint256 valid);
    error INVALID_LT(uint256 invalid, uint256 valid);
    error INVALID_ASSET_FEE(address asset, uint256 invalid, uint256 valid);
    error INVALID_ORACLE_DEVIATION(uint256 invalid, uint256 valid);
    error INVALID_ORACLE_TYPE(uint8 invalid);
    error INVALID_FEE_RECIPIENT(address invalid);
    error INVALID_LIQ_INCENTIVE(address asset, uint256 invalid, uint256 valid);
    error LIQ_AMOUNT_OVERFLOW(uint256 invalid, uint256 valid);
    error MAX_LIQ_OVERFLOW(uint256 value);
    error SCDP_WITHDRAWAL_VIOLATION(
        address asset,
        uint256 requested,
        uint256 principal,
        uint256 scaled
    );
    error INVALID_DEPOSIT_ASSET(address asset);
    error IDENTICAL_ASSETS();
    error NO_PUSH_PRICE(string underlyingId);
    error NO_PUSH_ORACLE_SET(string underlyingId);
    error INVALID_FEE_TYPE(uint8 invalid, uint8 valid);
    error ZERO_ADDRESS();
    error WRAP_NOT_SUPPORTED();
    error BURN_AMOUNT_OVERFLOW(uint256 burnAmount, uint256 debtAmount);
    error PAUSED(address who);
    error ZERO_OR_STALE_PRICE(string underlyingId);
    error SEQUENCER_DOWN_NO_REDSTONE_AVAILABLE();
    error NEGATIVE_PRICE(address asset, int256 price);
    error STALE_PRICE(string, uint256 timeFromUpdate, uint256 threshold);
    error PRICE_UNSTABLE(uint256 primaryPrice, uint256 referencePrice);
    error ORACLE_ZERO_ADDRESS(string underlyingId);
    error ASSET_DOES_NOT_EXIST(address asset);
    error ASSET_ALREADY_EXISTS(address asset);
    error INVALID_SEQUENCER_UPTIME_FEED(address);
    error INVALID_ASSET_ID(address asset);
    error NO_MINTED_ASSETS(address who);
    error NO_COLLATERALS_DEPOSITED(address who);
    error MISSING_PHASE_3_NFT();
    error MISSING_PHASE_2_NFT();
    error MISSING_PHASE_1_NFT();
    error DIAMOND_FUNCTION_NOT_FOUND(bytes4);
    error RE_ENTRANCY();
    error INVALID_VAULT_PRICE(string underlyingId);
    error INVALID_API3_PRICE(string underlyingId);
    error INVALID_CL_PRICE(string underlyingId);
    error ARRAY_LENGTH_MISMATCH(string asset, uint256 arr1, uint256 arr2);
    error ACTION_PAUSED_FOR_ASSET();
    error INVALID_KFACTOR(address asset, uint256 invalid, uint256 valid);
    error INVALID_CFACTOR(address asset, uint256 invalid, uint256 valid);
    error INVALID_MINTER_FEE(address asset, uint256 invalid, uint256 valid);
    error INVALID_DECIMALS(address asset, uint256 decimals);
    error INVALID_KRASSET_CONTRACT(address asset);
    error INVALID_KRASSET_ANCHOR(address asset);
    error SUPPLY_LIMIT(address asset, uint256 invalid, uint256 valid);
    error CANNOT_LIQUIDATE(uint256 collateralValue, uint256 minCollateralValue);
    error CANNOT_COVER(uint256 collateralValue, uint256 minCollateralValue);
    error INVALID_KRASSET_OPERATOR(address invalidOperator);
    error INVALID_ASSET_INDEX(address asset, uint256 index, uint256 maxIndex);
    error ZERO_DEPOSIT(address asset);
    error ZERO_AMOUNT(address asset);
    error ZERO_WITHDRAW(address asset);
    error ZERO_MINT(address asset);
    error ZERO_REPAY(address asset);
    error ZERO_BURN(address asset);
    error ZERO_DEBT(address asset);
    error SELF_LIQUIDATION();
    error REPAY_OVERFLOW(uint256 invalid, uint256 valid);
    error CUMULATE_AMOUNT_ZERO();
    error CUMULATE_NO_DEPOSITS();
    error REPAY_TOO_MUCH(uint256 invalid, uint256 valid);
    error SWAP_NOT_ENABLED(address assetIn, address assetOut);
    error SWAP_SLIPPAGE(uint256 invalid, uint256 valid);
    error SWAP_ZERO_AMOUNT();
    error NOT_INCOME_ASSET(address incomeAsset);
    error ASSET_NOT_ENABLED(address asset);
    error INVALID_ASSET_SDI(address asset);
    error ASSET_ALREADY_ENABLED(address asset);
    error ASSET_ALREADY_DISABLED(address asset);
    error INVALID_PRICE(address token, address oracle, int256 price);
    error INVALID_DEPOSIT(address token, uint256 assetsIn, uint256 sharesOut);
    error INVALID_WITHDRAW(address asset, uint256 sharesIn, uint256 assetsOut);
    error ROUNDING_ERROR(string desc, uint256 sharesIn, uint256 assetsOut);
    error MAX_DEPOSIT_EXCEEDED(
        address asset,
        uint256 assetsIn,
        uint256 maxDeposit
    );
    error MAX_SUPPLY_EXCEEDED(address asset, uint256 supply, uint256 maxSupply);
    error COLLATERAL_VALUE_LOW(uint256 value, uint256 minRequiredValue);
    error MINT_VALUE_LOW(
        address asset,
        uint256 value,
        uint256 minRequiredValue
    );
    error INVALID_FEE(uint256 invalid, uint256 valid);
    error NOT_A_CONTRACT(address who);
    error NO_ALLOWANCE(
        address spender,
        address owner,
        uint256 requested,
        uint256 allowed
    );
    error NOT_ENOUGH_BALANCE(address who, uint256 requested, uint256 available);
    error INVALID_DENOMINATOR(uint256 denominator, uint256 valid);
    error INVALID_OPERATOR(address who, address valid);
    error ZERO_SHARES(address asset);
    error ZERO_SHARES_OUT(address asset, uint256 assets);
    error ZERO_SHARES_IN(address asset, uint256 assets);
    error ZERO_ASSETS(address asset);
    error ZERO_ASSETS_OUT(address asset, uint256 shares);
    error ZERO_ASSETS_IN(address asset, uint256 shares);
}
