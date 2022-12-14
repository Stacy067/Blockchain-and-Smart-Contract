// SPDX-License-Identifier : GPL-3.0

pragma solidity >= 0.7.0 < 0.9.0;

/*
Call vs. Delegate Call

Delegate Call:
1. msg.sender가 본래의 스마트컨트랙 사용자를 나타냄
2. delegate call이 정의된 스마트컨트랙(즉 caller)이 외부 컨트랙의 함수들을 마치 자신의 것처럼 사용(실질적인 값도 caller에 저장)

조건
외부 스마트 컨트랙과 caller 스마트 컨트랙은 같은 변수를 갖고 있어야 함

why?
upgradable smart contract 용도

*/

contract add{
    uint256 public num = 0;
    event Info(address _addr, uint256 _num);

    function plusOne() public{
        num = num +1;
        emit Info(msg.sender, num);
    }
}

contract caller{
    uint256 public num = 0;
    function callNow(address _contractAddr) public payable{
        (bool success,) = _contractAddr.call(abi.encodeWithSignature("plusOne()"));
        require(success, "failed to transfer ether");
    }
    function delcateCallNow(address _contractAddr) public payable{
        (bool success,) = _contractAddr.delegatecall(abi.encodeWithSignature("plusOne()"));
        require(success,"failed to transfer ether");
    }
}