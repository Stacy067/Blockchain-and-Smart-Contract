// SPDX-License-Identifier : GPL-30

pragma solidity >= 0.7.0 < 0.9.0;

contract Father {
    event FatherName(string name);
    function who() public virtual{
        emit FatherName("KimDaeho");
        
    }
}

contract Son is Father {
    event sonName(string name);
    function who() public override{
        super.who();
        emit sonName("KimJin");
    }
}