pragma solidity ^0.5.0;

// lvl 1: equal split
contract AssociateProfitSplitter {
    // @TODO: Create three payable addresses representing `employee_one`, `employee_two` and `employee_three`.
    address payable public employee_one;
    address payable public employee_two;
    address payable public employee_three;

    constructor(address payable _one, address payable _two, address payable _three) public {
        employee_one = _one;
        employee_two = _two;
        employee_three = _three;
    }


    function balance() public view returns(uint, uint, uint) {
        return (employee_one.balance, employee_two.balance, employee_three.balance);
    }

    function deposit() public payable {
        // @TODO: Split `msg.value` into three
        //uint amount = _amount; // Your code here!
        employee_one.transfer(msg.value/3);
        // // @TODO: Transfer the amount to each employee
        // // Your code here!
        employee_two.transfer(msg.value/3);
        // // @TODO: take care of a potential remainder by sending back to HR (`msg.sender`)
        // // Your code here!
        employee_three.transfer(msg.value/3);
    }
    
    //0xF1fAEf394E35d1C3e0F67bB3004Af32B4Fb989c5
    //0x2D51cb6B7CD26C0bD69d7a07CF877936670F623d
    //0x0C19A5D49b5b519aA7447AbC158adF3043C95a25

    function() external payable {
        // require(msg.sender == employee_one, "sorry esta es no bueno");
        deposit();
    }
}