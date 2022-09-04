// SPDX-License-Identifier : GPL-3.0

pragma solidity >= 0.7.0 < 0.9.0;

// 에러 핸들러: require, revert, asset, try/catch

contract lec26{

/*
    0.8.0 포함 x
    0.8.1~
    assert : 오직 내부적 에러 테스트 용도, 불변성 체크 용도.
             assert가 에러를 발생시키면, panic(uint256)이라는 에러타입의 에러 발생
*/

    //3000000 gas
    function assertNow() public pure{
        assert(false); //test
    }

    //21322 gas 
    function revertNow() public pure {
        revert("error!"); //if or require = if + revert
    }
    //21344 gas
    function requireNow() public pure {
        require(false, "occurred");
    }

    function onlyAdults(uint256 _age) public pure returns(string memory){
        if( _age < 19){ // if true일때 실행
            revert("You are not allowed to pay for the cigarette");
        }
        return "Your payment is succeeded";
    }

    function onlyAdults2(uint256 _age) public pure returns(string memory){
        require(_age>19, "You are not allowed to pay for the cigarette"); // require 이 false일때 발생
        return "Your payment is succeeded";
    }


}