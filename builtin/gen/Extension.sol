// Copyright (c) 2018 The VeChainThor developers
 
// Distributed under the GNU Lesser General Public License v3.0 software license, see the accompanying
// file LICENSE or <https://www.gnu.org/licenses/lgpl-3.0.html>

pragma solidity ^0.4.18;

/// @title Extension extends EVM functions.

contract Extension {
    function blake2b256(bytes _value) public view returns(bytes32) {
        return ExtensionNative(this).native_blake2b256(_value);
    }

    function blockID(uint num) public view returns(bytes32) {
        if(num >= block.number)
            return;
        return ExtensionNative(this).native_blockID(uint32(num));
    }

    function blockTotalScore(uint num) public view returns(uint64) {
        if(num > block.number)
            return;
        return ExtensionNative(this).native_blockTotalScore(uint32(num));
    }

    function blockTime(uint num) public view returns(uint) {
        if(num > block.number)
            return;
        return ExtensionNative(this).native_blockTimestamp(uint32(num));
    }

    function blockSigner(uint num) public view returns(address) {
        if(num > block.number)
            return;
        return ExtensionNative(this).native_blockSigner(uint32(num));
    }

    function totalSupply() public view returns(uint256) {
        return ExtensionNative(this).native_tokenTotalSupply();
    }

    function txProvedWork() public view returns(uint256) {
        return ExtensionNative(this).native_transactionProvedWork();
    }

    function txID() public view returns(bytes32) {
        return ExtensionNative(this).native_transactionID();
    }

    function txBlockRef() public view returns(bytes8) {
        return ExtensionNative(this).native_transactionBlockRef();
    }

    function txExpiration() public view returns(uint) {
        return ExtensionNative(this).native_transactionExpiration();
    }
}

contract ExtensionNative {
    function native_blake2b256(bytes _value) public view returns(bytes32);
    function native_blockID(uint32 num) public view returns(bytes32);
    function native_blockTotalScore(uint32 num) public view returns(uint64);
    function native_blockTimestamp(uint32 num) public view returns(uint64);
    function native_blockSigner(uint32 num)public view returns(address);
    function native_tokenTotalSupply()public view returns(uint256);
    function native_transactionProvedWork()public view returns(uint256);    
    function native_transactionID()public view returns(bytes32);    
    function native_transactionBlockRef()public view returns(bytes8);
    function native_transactionExpiration()public view returns(uint32);
}