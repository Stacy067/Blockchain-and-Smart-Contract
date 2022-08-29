// SPDX-License-Identifier : GPL-30

pragma solidity >= 0.7.0 < 0.9.0;

contract lec18{

    uint256[] public ageArray;
    uint256[10] public ageFixedSizeArray;

    string[] public nameArray = ["Kal", "John", "Kerri"];

    function AgeLength() public view returns(uint256){
        return ageArray.length;
    }

    //0 -> 50 / 1 -> 70 / Length :2
    function AgePush(uint256 _age)public{
        ageArray.push(_age);
    }

    // 1 -> 70
    function AgeGet(uint256 _index)public view returns(uint256){
        return ageArray[_index];
    }


    //0 -> 50 / Length :1
    function AgePop()public{
        ageArray.pop();
    }

    //0 -> 0 / 1 -> 70 / Length :2
    function AgeDelete(uint256 _index)public{
        delete ageArray[_index];
    }

    //0 -> 90 / 1 -> 70 / Length :2
    function AgeChange(uint256 _index, uint256 _age)public{
        ageArray[_index] = _age;
    }


}