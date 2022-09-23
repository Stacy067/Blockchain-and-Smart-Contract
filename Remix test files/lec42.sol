// SPDX-License-Identifier : GPL-3.0

pragma solidity >= 0.7.0 < 0.9.0;

/* 
1. 1 이더만 내야함
2. 중복해서 참여 불가 (단, 누군가 적립금을 받으면 초기화)
3. 관리자만 적립된 이더를 볼 수 있음
4. 3의 배수 번째 사람에게만 적립 이더를 줌
*/

contract MoneyBox{
    event WhoPaid(address indexed sender, uint256 payment);
    address owner;

    mapping (uint256 => mapping(address => bool)) paidMemberList;

    /* round는 mapping의 key 값  
    1 round : A : true, B : true, C :paidMemberList
    2 round : E, R, D / D paidMemberList / D만 true, A B C false
    3 round : A, R, B / B paidMemberList
    4 round : all user false
    */


    uint256 round = 1;

    constructor(){
        owner = msg.sender;
    }
    receive() external payable {
        require(msg.value == 0.01 ether, "Must be 1 ether.");
        require(paidMemberList[round][msg.sender] == false, "Must be a new player in each game.");
        //받은 사람 기록
        paidMemberList[round][msg.sender]=true;

        emit WhoPaid(msg.sender, msg.value);
        //sender가 ether를 전송하기 위해서 payable로
        if(address(this).balance == 0.03 ether){
            (bool sent,) = payable(msg.sender).call{value:address(this).balance}("");
            require(sent, "Failed to pay");
            round++;
            //round 다음으로 진행
        }
    }

    function checkRound() public view returns(uint256){
        return round;
    }

    function checkValue() public view returns(uint256){
        require(owner==msg.sender, "Only Owner can check the value");
        return address(this).balance;
    }

}