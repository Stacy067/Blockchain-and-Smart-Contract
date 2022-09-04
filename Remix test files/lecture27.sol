// SPDX-License-Identifier : GPL-3.0

pragma solidity >= 0.7.0 < 0.9.0;

//try/catch



/*
0.6 버전 이후
try/catch 왜 써야하는가?
    기존의 에러 핸들러 assert/revert/require는 에러를 발생시키고 프로그램을 끝냄.
    그러나, try/catch로 에러가 났어도, 프로그램을 종료시키지 않고 어떠한 대처를 하게 만들 수 있음.

try/catch 특징

1.
try/catch 문 안에서 assert/revert/require를 통해 에러가 난다면 catch는 에러를 잡지를 못하고,
개발자가 의도한지 알고 정상적으로 프로그램을 끝냄

try/catch 문 밖에서 assert/revert/require를 통해 에러가 난다면 catch는 에러를 잡고, 에러핸들 가능

2. 3가지 catch
catch Error(string memory reason) { ... } : revert나 require을 통해 생성된 에러 용도
catch Panic(unit errorCode) { ... } : assert를 통해 생성된 에러가 날 때 이 catch에 잡힘

errorCode는 솔리디티에서 정의 Panic 에러별로 나옴
0x00: Used for generic compiler inserted panics
0x01: If you call assert with an argument that evaluateds to false
0x11: If an arithmetic operation results in underflow or overflow outside of an unchecked { ... } block
0x12: If you divide or module by zero (e.g. 5 / 0 or 23%0)
0x21: If you convert a value that is too big or negative into an enum type
0x22: If you access a storage byte array that is incorrectly encoded
0x31: If you call .pop() on an empty array
0x32: If you access an array, bytesN or an array slice at an out-of-bounds or negative index (i.e. x[i] where i >= x.length or i < 0).
0x41: If you allocate too much memory or create an array that is too large.
0x51: If you call a zero-initialized variable of internal function type.
예를 들어, 나누기가 0이 된다면 0x12(=18) errorCode를 리턴
하나 더, Panic은 0.8.0 버전에는 없고 0.8.1 버전부터 있음

catch(bytesmemoryLowLevelData){...} : 이 catch는 로우 레벨 에러를 잡음


*/

contract math{

    function division(uint256 _num1, uint256 _num2) public pure returns (uint256){
        require(_num1<10, "num1 should not be more than 10");
        return _num1/_num2;
    }
}

contract runner{
    event catchErr(string _name, string _err);
    event catchPanic(string _name, uint256 _err);
    event catchLowLevelErr(string _name, bytes _err);
    
    math public mathInstance = new math();
    
    function playTryCatch(uint256 _num1, uint256 _num2) public returns(uint256,bool){
        
        try mathInstance.division(_num1, _num2) returns(uint256 value){
            return(value, true);

        } catch Error(string memory _err) {

            emit catchErr("revert/require", _err);
            return(0, false);

        } catch Panic(uint256 _errorCode) {

            emit catchPanic("assertError/Panic", _errorCode);
            return (0, false);

        } catch (bytes memory _errorCode){

            emit catchLowLevelErr("LowlevelError", _errorCode);
            return(0, false);
        }
    }
}


