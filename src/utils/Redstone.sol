// solhint-disable
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;
import {vm} from "./Minimals.sol";

abstract contract RedstonePayload {
    string internal _payloadGetterScript;

    constructor(string memory scriptLocation) {
        if (bytes(scriptLocation).length != 0) {
            _payloadGetterScript = scriptLocation;
        } else {
            revert("RedstoneScript: script location is empty");
        }
    }

    function getRedstonePayload(
        // dataFeedId:value:decimals
        string memory priceFeed
    ) public returns (bytes memory) {
        string[] memory args = new string[](3);
        args[0] = "node";
        args[1] = _payloadGetterScript;
        args[2] = priceFeed;

        return vm.ffi(args);
    }
}

abstract contract RedstoneScript is RedstonePayload {
    address internal __current_kresko;

    constructor(string memory scriptLocation) RedstonePayload(scriptLocation) {}

    function staticCall(
        address target,
        bytes4 selector,
        string memory prices
    ) public returns (uint256) {
        (bool success, bytes memory data) = address(target).staticcall(
            abi.encodePacked(
                abi.encodeWithSelector(selector),
                getRedstonePayload(prices)
            )
        );
        if (!success) _revert(data);
        return abi.decode(data, (uint256));
    }

    function staticCall(
        bytes4 selector,
        string memory prices
    ) public returns (uint256) {
        (bool success, bytes memory data) = address(__current_kresko)
            .staticcall(
                abi.encodePacked(
                    abi.encodeWithSelector(selector),
                    getRedstonePayload(prices)
                )
            );
        if (!success) _revert(data);
        return abi.decode(data, (uint256));
    }

    function staticCall(
        bytes4 selector,
        address param1,
        address param2,
        string memory prices
    ) public returns (uint256) {
        (bool success, bytes memory data) = address(__current_kresko)
            .staticcall(
                abi.encodePacked(
                    abi.encodeWithSelector(selector, param1, param2),
                    getRedstonePayload(prices)
                )
            );
        if (!success) _revert(data);
        return abi.decode(data, (uint256));
    }

    function staticCall(
        bytes4 selector,
        bool param1,
        string memory prices
    ) public returns (uint256) {
        (bool success, bytes memory data) = address(__current_kresko)
            .staticcall(
                abi.encodePacked(
                    abi.encodeWithSelector(selector, param1),
                    getRedstonePayload(prices)
                )
            );
        if (!success) _revert(data);
        return abi.decode(data, (uint256));
    }

    function staticCall(
        bytes4 selector,
        address param1,
        bool param2,
        string memory prices
    ) public returns (uint256) {
        (bool success, bytes memory data) = address(__current_kresko)
            .staticcall(
                abi.encodePacked(
                    abi.encodeWithSelector(selector, param1, param2),
                    getRedstonePayload(prices)
                )
            );
        if (!success) _revert(data);
        return abi.decode(data, (uint256));
    }

    function staticCall(
        bytes4 selector,
        address param1,
        string memory prices
    ) public returns (uint256) {
        (bool success, bytes memory data) = address(__current_kresko)
            .staticcall(
                abi.encodePacked(
                    abi.encodeWithSelector(selector, param1),
                    getRedstonePayload(prices)
                )
            );
        if (!success) _revert(data);
        return abi.decode(data, (uint256));
    }

    function call(
        bytes4 selector,
        address param1,
        uint256 param2,
        string memory prices
    ) public {
        (bool success, bytes memory data) = address(__current_kresko).call(
            abi.encodePacked(
                abi.encodeWithSelector(selector, param1, param2),
                getRedstonePayload(prices)
            )
        );
        if (!success) _revert(data);
    }

    function call(
        bytes4 selector,
        address param1,
        uint256 param2,
        address param3,
        string memory prices
    ) public {
        (bool success, bytes memory data) = address(__current_kresko).call(
            abi.encodePacked(
                abi.encodeWithSelector(selector, param1, param2, param3),
                getRedstonePayload(prices)
            )
        );
        if (!success) _revert(data);
    }

    function call(
        bytes4 selector,
        address param1,
        address param2,
        uint256 param3,
        string memory prices
    ) public {
        (bool success, bytes memory data) = address(__current_kresko).call(
            abi.encodePacked(
                abi.encodeWithSelector(selector, param1, param2, param3),
                getRedstonePayload(prices)
            )
        );
        if (!success) _revert(data);
    }

    function call(
        bytes4 selector,
        address param1,
        address param2,
        uint256 param3,
        address param4,
        string memory prices
    ) public {
        (bool success, bytes memory data) = address(__current_kresko).call(
            abi.encodePacked(
                abi.encodeWithSelector(
                    selector,
                    param1,
                    param2,
                    param3,
                    param4
                ),
                getRedstonePayload(prices)
            )
        );
        if (!success) _revert(data);
    }

    function call(
        address target,
        bytes memory encodedFunction,
        string memory prices
    ) public {
        (bool success, bytes memory data) = address(target).call(
            abi.encodePacked(encodedFunction, getRedstonePayload(prices))
        );
        if (!success) _revert(data);
    }

    function call(
        bytes4 selector,
        address param1,
        address param2,
        address param3,
        uint256 param4,
        uint256 param5,
        string memory prices
    ) public {
        (bool success, bytes memory data) = address(__current_kresko).call(
            abi.encodePacked(
                abi.encodeWithSelector(
                    selector,
                    param1,
                    param2,
                    param3,
                    param4,
                    param5
                ),
                getRedstonePayload(prices)
            )
        );
        if (!success) _revert(data);
    }

    function call(
        bytes4 selector,
        address param1,
        address param2,
        uint256 param3,
        uint256 param4,
        address param5,
        string memory prices
    ) public {
        (bool success, bytes memory data) = address(__current_kresko).call(
            abi.encodePacked(
                abi.encodeWithSelector(
                    selector,
                    param1,
                    param2,
                    param3,
                    param4,
                    param5
                ),
                getRedstonePayload(prices)
            )
        );
        if (!success) _revert(data);
    }

    function call(
        bytes4 selector,
        address param1,
        address param2,
        uint256 param3,
        uint256 param4,
        string memory prices
    ) public {
        (bool success, bytes memory data) = address(__current_kresko).call(
            abi.encodePacked(
                abi.encodeWithSelector(
                    selector,
                    param1,
                    param2,
                    param3,
                    param4
                ),
                getRedstonePayload(prices)
            )
        );
        if (!success) _revert(data);
    }

    function _revert(bytes memory data) internal pure {
        assembly {
            revert(add(32, data), mload(data))
        }
    }
}
