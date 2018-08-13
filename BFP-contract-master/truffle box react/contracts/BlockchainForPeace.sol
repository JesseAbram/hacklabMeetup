pragma solidity ^0.4.24;

contract BlockchainForPeace {
    

    // to see the total raised 
    uint public raised;
    address public charity; 
    
    //struct for the donation 
    struct Donation {
        string message; 
        uint value; 
    }
    //mapping an address to the donation struct 
    mapping (address => Donation) public donors;
    
    //constructor to initiate the address of the charity being donated to
    constructor (address _charity) public {
        charity = _charity;
    }
   
    // payable function which auto trasnfers money to charity address, collects the value and increases the total value counter.
    function () payable public {
        charity.transfer(msg.value);
        donors[msg.sender].value = msg.value; 
        raised += msg.value;
    }
    // optional message to be sent with donation, peace message.
    function messageForPeace(string _message) public {
        require(donors[msg.sender].value != 0);
        donors[msg.sender].message = _message;
    }
    
    event Donate (address indexed from, uint amount);
}