// SPDX-License-Identifier : GPL-3.0

pragma solidity >= 0.7.0 < 0.9.0;

/*
주소.balance
주소.balance는 해당 특정 주소의 현재 갖고 있는 이더의 잔액을 나타냄 (msg.value는 송금액)
주소.balance와 같은 형태로 사용

msg.sender
msg.sender는 스마트컨트랙을 사용하는 주체
msg.sender는 앞으로 설명해야할 call vs. delegate call에서 주로 나올 내용
*/

contract MobileBanking{

    event SendInfo(address _msgSender, uint256 _currentValue);
    event MyCurrentValue(address _msgSender, uint256 _value);
    event CurrentValueOfSomeone(address _msgSender, address _to, uint256 _value);

    function sendEther(address payable _to) public payable{
        require(msg.sender.balance>=msg.value, "Your balance is not enough");
        _to.transfer(msg.value);
        emit SendInfo(msg.sender, (msg.sender).balance);
    }

    function checkValueNow() public{
        emit MyCurrentValue(msg.sender, msg.sender.balance);
    }

    function checkUserMoney(address _to) public{
        emit CurrentValueOfSomeone(msg.sender, _to, _to.balance);
    }

}

