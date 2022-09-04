// SPDX-License-Identifier : GPL-3.0

pragma solidity >= 0.7.0 < 0.9.0;

contract lec24{

    event CountryIndexname(uint256 indexed _index, string _name);
    string[] private countryList = ["South Korea", "North Korea", "USA", "China", "Japan"];

    //Taiwan
    function linearSearch(string memory _search) public view returns(uint256, string memory){

        for(uint256 i=0; i<countryList.length; i++){
            // string을 비교하는 방법
            if(keccak256(bytes(countryList[i])) == keccak256(bytes(_search))){
                return (i, countryList[i]);
            }
        }
        return(0,"Nothing");
    }


}