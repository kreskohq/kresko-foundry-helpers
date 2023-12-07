// solhint-disable
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import {Purify} from "./Purify.sol";

address constant clgAddr = 0x000000000000000000636F6e736F6c652e6c6f67;
address constant fSender = 0x1804c8AB1F12E6bbf3894d4083f33e07309d1f38;
address constant vmAddr = 0x7109709ECfa91a80626fF3989D68f67F5b1DD12D;
string constant rs_script_def = "utils/getRedstonePayload.js";

function logp(bytes memory _p) pure {
    Purify.BytesIn(logv)(_p);
}

function logv(bytes memory _b) view {
    uint256 len = _b.length;
    address _a = clgAddr;
    /// @solidity memory-safe-assembly
    assembly {
        let start := add(_b, 32)
        let r := staticcall(gas(), _a, start, len, 0, 0)
    }
}

interface FFIVm {
    function ffi(string[] memory) external returns (bytes memory);
}

FFIVm constant vmFFI = FFIVm(vmAddr);

function hasVM() view returns (bool) {
    uint256 len = 0;
    assembly {
        len := extcodesize(vmAddr)
    }
    return len > 0;
}

function getPayloadRs(string memory _mstr) returns (bytes memory) {
    return getPayloadRs(rs_script_def, _mstr);
}

function getPayloadRs(
    string memory _loc,
    string memory _mstr
) returns (bytes memory) {
    string[] memory args = new string[](3);
    args[0] = "node";
    args[1] = _loc;
    args[2] = _mstr;

    return vmFFI.ffi(args);
}

function __revert(bytes memory _d) pure {
    assembly {
        revert(add(32, _d), mload(_d))
    }
}