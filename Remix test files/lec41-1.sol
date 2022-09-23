// SPDX-License-Identifier : GPL-3.0

pragma solidity >= 0.7.0 < 0.9.0;

/*
contract A 위치를 모를때 B에 import 하는 경우
import "./A" 
contract A{
}
contract B is A {
}
*/

library SafeMath0{
    //0~255;
    function add(uint8 a, uint8 b) internal pure returns (uint8){
        require(a+b>=a, "SafeMath: addition overflow");
        return a + b;
    }
}

contract HiSolidity{
    event Hi(string _str);

    function hi() public{
        emit Hi("Hello solidity");
    }
}