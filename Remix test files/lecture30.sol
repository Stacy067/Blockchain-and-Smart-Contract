// SPDX-License-Identifier : GPL-3.0

pragma solidity >= 0.7.0 < 0.9.0;

//modifier


contract lec30{
/*

    function onlyAdults2(uint256 _age) public pure returns(string memory){
        require(_age>25, "You are not allowed to pay for the cigarette"); // require 이 false일때 발생
        return "Your payment is succeeded";
    }

    function onlyAdults3(uint256 _age) public pure returns(string memory){
        require(_age>25, "You are not allowed to pay for the cigarette"); // require 이 false일때 발생
        return "Your payment is succeeded";
    }
*/

    modifier onlyAdults{
        revert("You are not allowed to pay for the cigarette");
        _;
    }
    function BuyCigarette() public onlyAdults returns(string memory){
        return "Your payment is succeeded";
    }
    
    modifier onlyAdults2(uint256 _age){
        require(_age>18, "You are not allowed to pay for the cigarette");
        _;
    }
    function BuyCigarette2(uint256 _age) public onlyAdults2(_age) returns(string memory){
        return "Your payment is succeeded";
    }

    uint256 public num = 5;
    modifier numChange{
        _;
        num = 10;
    }
    function numChganeFunction() public numChange{
        num = 15;
    }


}