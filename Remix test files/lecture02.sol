// SPDX-License-Identifier : GPL-30

pragma solidity >= 0.7.0 < 0.9.0;

contract lec2{

    // data type
    // bolean, bytes, address, uint
    
    // reference type
    // string, Arrays, struct

    // mapping type

    //boolean : true / false
    bool public b = false;

    // ! || == &&
    bool public b1 = !false; //true
    bool public b2 = false || true; //true
    bool public b3 = false == true; //false
    bool public b4 = false && true; //false

    // bytes 1 ~ 32
    bytes4 public bt = 0x12345678;
    bytes public bt2 = "STRING";    

    // address : 
    address public addr = 0xf8e81D47203A594245E36C48e151709F0C19fBe8;

    // int vs uint

    // int8
    // -2^7 ~ 2^7 -1
    int8 public it = 4;

    // uint8
    // 0 ~ 2^8 -1
    uint256 public uit = 132213;
    // + - * /
    uint8 public uit2 = 256; // since 256 > 2^8 -1, this makes an error.




}