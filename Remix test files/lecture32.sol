// SPDX-License-Identifier : GPL-3.0

pragma solidity >= 0.5.0 < 0.9.0;

contract lec32{
    /*
    Payable
    Payable은 이더/토큰과 상호작용시 필요한 키워드라고 생각하시면 간단합니다.
    즉, send, transfer, call을 이용하여, 이더를 보낼때 Payable 이라는 키워드가 필요함
    이 Payable은 주로 함수, 주소, 생서아젱 붙여서 사용

    msg.value
    msg.value는 송금보낸 코인의 값

    이더를 보내는 3가지
    1. send : 2300 gas를 소비, 성공여부를 에러가 아닌 true / false 로 리턴
    2. transfer : 2300 gas를 소비, 실패시 에러 발생
    3. call : 가변적인 gas 소비 (gas 값 지정 가능), 성공여부를 true 또는 false로 리텅
              gas 다 쓸때까지 반복, 재진입(reentrancy) 공격 위험성 있음, 2019년 12월 이후 call 사용을 추천
              
    
    */
    event howMuch(uint256 _value);

    function sendNow(address payable _to) public payable{
        bool sent = _to.send(msg.value); // return true or false
        require(sent, "Failed to send either");
        emit howMuch(msg.value);
    }

    function transferNow(address payable _to) public payable{
        _to.transfer(msg.value);
        emit howMuch(msg.value);
    }

    function callNow (address payable _to) public payable{
        // ~ 0.7
        (bool sent, ) = _to.call.gas(1000).value(msg.value)("");
        require(sent, "Falied to send either");

        // 0.7 ~
        // (bool sent, ) = _to.call{value: msg.value, gas:1000}("");
        // require(sent, "Faied to send either");
        emit howMuch(msg.value);

    }


}
