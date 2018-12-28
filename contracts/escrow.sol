pragma solidity ^0.4.13;

contract Escrow {
    address public buyer;
    address public seller;
    address public arbiter; 
    uint public productId;
    uint public amount;
    mapping(address => bool) refundAmount;
    mapping(address => bool) releaseAmount;
    uint public refundCount;
    uint public releaseCount;
    bool fundDisbursed;
    
    event createEscrow(uint _productId, address _buyer, address _seller, address _arbiter);
    event UnlockAmount(uint _productId, string _operation, address _operator);
    event DisbursedAmount(uint _productId, uint amount, address _beneficiary);
    
    function escrowInfo() view public returns(address, address, address, bool, uint, uint){
        return(buyer, seller, arbiter, fundDisbursed, refundCount, releaseCount);
    }
    
    function Escrow(uint _productId, address _buyer, address _seller, address _arbiter) payable public {
        fundDisbursed = false;
        productId = _productId;
        buyer = _buyer;
        seller = _seller;
        arbiter = _arbiter;
        amount = msg.value;
        createEscrow(_productId, _buyer, _seller, _arbiter);
    }
    function releaseAmountToSeller(address caller) public {
        require(fundDisbursed = false);
        if((caller == buyer || caller == seller || caller == arbiter) && releaseAmount[caller] != true){
            releaseAmount[caller] = true;
            releaseCount += 1;
            UnlockAmount(productId, "release", caller);
        }
        if(releaseCount == 2){
            seller.transfer(amount);
            DisbursedAmount(productId, amount, seller);
            fundDisbursed = true;
        }
    }
    
    function refundAmountToBuyer(address caller) public {
        require(fundDisbursed = false);
        if((caller == buyer || caller == seller || caller == arbiter) && releaseAmount[caller] != true){
            refundAmount[caller] = true;
            refundCount += 1;
            UnlockAmount(productId, "refund", caller);
        }
        if(refundCount == 2){
            buyer.transfer(amount);
            DisbursedAmount(productId, amount, buyer);
            fundDisbursed = true;
        }
    }
    
}