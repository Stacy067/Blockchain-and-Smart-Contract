// SPDX-License-Identifier : GPL-30

pragma solidity >= 0.7.0 < 0.9.0;

// Mapping을 보통 선호하나, Length 구할 수 없음
contract lec17{

    mapping(uint256=>uint256) private ageList;
    mapping(string=>uint256) private priceList;
    mapping(uint256=>string) private nameList;

    function setAgeList(uint256 _index, uint256 _age) public{
        ageList[_index] = _age;
    }

    function getAge(uint256 _index) public view returns(uint256){
        return ageList[_index];
    }

    function setNameList(uint256 _index, string memory _name) public{
        nameList[_index] = _name;
    }

    function getName(uint256 _index) public view returns(string memory){
        return nameList[_index];
    }

    function setPriceList(string memory _itemName, uint256 _price) public {
        priceList[_itemName] = _price;
    }

    function getPriceList(string memory _index) public view returns(uint256) {
        return priceList[_index];
    }

}