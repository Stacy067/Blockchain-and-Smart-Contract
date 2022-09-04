// SPDX-License-Identifier : GPL-3.0

pragma solidity >= 0.7.0 < 0.9.0;

/*
3. 어디서 쓰는지?

외부 스마트 컨트랙트 함수를 부를때 : 다른 스마트 컨트랙트를 인스턴스화해서, try/catch문이 있는 스마트컨트랙트 함수를 불러와서 사용
외부 스마트 컨트랙트 생성 할때: 다른 스마트컨트랙트를 인스턴스화 생성할 때 씀
스마트 컨트랙트 내에서 함수를 부를때 : this를 통해 try/catch를 씀
*/

//외부 스마트컨트랙트 생성

contract character{

    string private name;
    uint256 private power;

    constructor(string memory _name, uint256 _power){
        //revert("error");
        name = _name;
        power = _power;
    }
}

contract runner{

    event catchOnly(string _name, string _err);

    function playTryCatch(string memory _name, uint256 _power) public returns(bool successOrFail){
        //revert("errors in the try/catch block");
        try new character(_name, _power){
            return(true);
        }
        catch{ //각각 안써줘도 에러 잡을 수 있음
            emit catchOnly("catch", "ErrorS!!");
            return(false);
        }
    }
}

// 스마트컨트랙트 내에서 함수로 부를때

contract runner2{
    function simple() public returns(uint256){
        return 4;
    }
    event catchOnly(string _name, string _err);

    function playTryCatch() public returns(uint256, bool){
        try this.simple() returns(uint256 _value){
            return(_value, true);
        }
        catch{
            emit catchOnly("catch", "ErrorS!!");
            return(0,false);
        }
    }
}