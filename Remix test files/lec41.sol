// SPDX-License-Identifier : GPL-3.0

pragma solidity >= 0.6.0 < 0.8.0;
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/docs-v3.x/contracts/math/SafeMath.sol";
//import "./lec41-1.sol";
// 같은 폴더: ./파일명.sol
// 외부 폴더에 있을때: ../파일명.sol
// 다른 폴더: ./폴더명/파일명.sol

contract lec41{
    using SafeMath for uint256;
    uint256 public a;
    uint256 public maximum = 2**256-1; // 2**256 == 2^256
    function becomeOverflow(uint256 _num1, uint256 _num2) public{
        a = _num1.add(_num2);
    }
}




