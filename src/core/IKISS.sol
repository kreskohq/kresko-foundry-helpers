// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {IERC20} from "../token/IERC20.sol";
import {IKreskoAssetIssuer} from "./IKreskoAsset.sol";

interface IERC165 {
    /// @notice Query if a contract implements an interface
    /// @param interfaceId The interface identifier, as specified in ERC-165
    /// @dev Interface identification is specified in ERC-165. This function
    ///  uses less than 30,000 gas.
    /// @return `true` if the contract implements `interfaceID` and
    ///  `interfaceID` is not 0xffffffff, `false` otherwise
    function supportsInterface(bytes4 interfaceId) external view returns (bool);
}

interface IVaultExtender {
    event Deposit(address indexed _from, address indexed _to, uint256 _amount);
    event Withdraw(address indexed _from, address indexed _to, uint256 _amount);

    /**
     * @notice Deposit tokens to vault for shares and convert them to equal amount of extender token.
     * @param _assetAddr Supported vault asset address
     * @param _assets amount of `_assetAddr` to deposit
     * @param _receiver Address receive extender tokens
     * @return sharesOut amount of shares/extender tokens minted
     * @return assetFee amount of `_assetAddr` vault took as fee
     */
    function vaultDeposit(
        address _assetAddr,
        uint256 _assets,
        address _receiver
    ) external returns (uint256 sharesOut, uint256 assetFee);

    /**
     * @notice Deposit supported vault assets to receive `_shares`, depositing the shares for equal amount of extender token.
     * @param _assetAddr Supported vault asset address
     * @param _receiver Address receive extender tokens
     * @param _shares Amount of shares to receive
     * @return assetsIn Amount of assets for `_shares`
     * @return assetFee Amount of `_assetAddr` vault took as fee
     */

    /**
     * @notice Vault mint, an external state-modifying function.
     * @param _assetAddr The asset addr address.
     * @param _shares The shares (uint256).
     * @param _receiver The receiver address.
     * @return assetsIn An uint256 value.
     * @return assetFee An uint256 value.
     * @custom:signature vaultMint(address,uint256,address)
     * @custom:selector 0x0c8daea9
     */
    function vaultMint(
        address _assetAddr,
        uint256 _shares,
        address _receiver
    ) external returns (uint256 assetsIn, uint256 assetFee);

    /**
     * @notice Withdraw supported vault asset, burning extender tokens and withdrawing shares from vault.
     * @param _assetAddr Supported vault asset address
     * @param _assets amount of `_assetAddr` to deposit
     * @param _receiver Address receive extender tokens
     * @param _owner Owner of extender tokens
     * @return sharesIn amount of shares/extender tokens burned
     * @return assetFee amount of `_assetAddr` vault took as fee
     */
    function vaultWithdraw(
        address _assetAddr,
        uint256 _assets,
        address _receiver,
        address _owner
    ) external returns (uint256 sharesIn, uint256 assetFee);

    /**
     * @notice  Withdraw supported vault asset for  `_shares` of extender tokens.
     * @param _assetAddr Token to deposit into vault for shares.
     * @param _shares amount of extender tokens to burn
     * @param _receiver Address to receive assets withdrawn
     * @param _owner Owner of extender tokens
     * @return assetsOut amount of assets out
     * @return assetFee amount of `_assetAddr` vault took as fee
     */
    function vaultRedeem(
        address _assetAddr,
        uint256 _shares,
        address _receiver,
        address _owner
    ) external returns (uint256 assetsOut, uint256 assetFee);

    /**
     * @notice Max redeem for underlying extender token.
     * @param assetAddr The withdraw asset address.
     * @param owner The extender token owner.
     * @return max Maximum amount withdrawable.
     * @return fee Fee paid if max is withdrawn.
     * @custom:signature maxRedeem(address,address)
     * @custom:selector 0x95b734fb
     */
    function maxRedeem(
        address assetAddr,
        address owner
    ) external view returns (uint256 max, uint256 fee);

    /**
     * @notice Deposit shares for equal amount of extender token.
     * @param _shares amount of vault shares to deposit
     * @param _receiver address to mint extender tokens to
     * @dev Does not return a value
     */
    function deposit(uint256 _shares, address _receiver) external;

    /**
     * @notice Withdraw shares for equal amount of extender token.
     * @param _amount amount of vault extender tokens to burn
     * @param _receiver address to send shares to
     * @dev Does not return a value
     */
    function withdraw(uint256 _amount, address _receiver) external;

    /**
     * @notice Withdraw shares for equal amount of extender token with allowance.
     * @param _from address to burn extender tokens from
     * @param _to address to send shares to
     * @param _amount amount to convert
     * @dev Does not return a value
     */
    function withdrawFrom(address _from, address _to, uint256 _amount) external;
}

interface IKISS is IKreskoAssetIssuer, IVaultExtender, IERC20, IERC165 {
    function vKISS() external view returns (address);

    function kresko() external view returns (address);

    /**
     * @notice This function adds KISS to circulation
     * Caller must be a contract and have the OPERATOR_ROLE
     * @param _amount amount to mint
     * @param _to address to mint tokens to
     * @return uint256 amount minted
     */
    function issue(
        uint256 _amount,
        address _to
    ) external override returns (uint256);

    /**
     * @notice This function removes KISS from circulation
     * Caller must be a contract and have the OPERATOR_ROLE
     * @param _amount amount to burn
     * @param _from address to burn tokens from
     * @return uint256 amount burned
     *
     * @inheritdoc IKreskoAssetIssuer
     */
    function destroy(
        uint256 _amount,
        address _from
    ) external override returns (uint256);

    /**
     * @notice Triggers stopped state.
     *
     * Requirements:
     *
     * - The contract must not be paused.
     */
    function pause() external;

    /**
     * @notice  Returns to normal state.
     *
     * Requirements:
     *
     * - The contract must be paused.
     */
    function unpause() external;

    /**
     * @notice Exchange rate of vKISS to USD.
     * @return rate vKISS/USD exchange rate.
     * @custom:signature exchangeRate()
     * @custom:selector 0x3ba0b9a9
     */
    function exchangeRate() external view returns (uint256 rate);

    /**
     * @notice Overrides `AccessControl.grantRole` for following:
     * @notice EOA cannot be granted Role.OPERATOR role
     * @param _role role to grant
     * @param _to address to grant role for
     */
    function grantRole(bytes32 _role, address _to) external;
}
