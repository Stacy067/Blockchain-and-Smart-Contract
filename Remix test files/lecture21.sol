// SPDX-License-Identifier : GPL-30

pragma solidity >= 0.7.0 < 0.9.0;

contract lec21{
    /*
    Case 1 : if-else
    if(if가 발동되는 조건){
        if 내용
    }
    else{if가 발동이 안되면
        else 내용
    }
    
    Case 2 : if-else if-else
    if(if가 발동되는 조건){
        if 내용
    }
    else if(else if가 발동되는 조건){
        else if 내용
    }
    ...
    else{if가 발동이 안되면
        else 내용
    }
    */

    string private outcome = "";
    function isIt5(uint256 _number) public returns(string memory){
        if(_number == 5){
            outcome = "Yes, it is 5";
            return outcome;
        }
        //else 안써도 쓴 효과 남
        /*else{
            outcome = "No, it is not 5";
            return outcome;
        }*/ 
        outcome = "No, it is not 5";
        return outcome;
        //5 일때 if만 발동하고, 그 이후 발동 x
        //5 아니면 if함수 발동 안되서 바로 outcome으로 이동
    }

    
    function isIt5or3or1(uint256 _number) public returns(string memory){
        if(_number == 5){
            outcome = "Yes, it is 5";
            return outcome;
        }
        else if(_number ==3){
            outcome = "Yes, it is 3";
            return outcome;
        } 
        else{
            outcome = "No, it is not 5 or 3";
            return outcome;
        }        //5 일때 if만 발동하고, 그 이후 발동 x
        //5 아니면 if함수 발동 안되서 바로 outcome으로 이동
    }

}