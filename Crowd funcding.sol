// SPDX-License-Identifier: MIT

pragma solidity ^0.8.11;

contract CrowdFunding
{
    mapping(address=>uint) public Contributors;
    address public Manager;
    uint public MinimumContribution;
    uint public Deadline;
    uint public Target;
    uint public CollectedDAmount;
    uint public NoofContributors;

    struct RequestAmount
    {
       string Description;
       address payable Recipient;
       uint ValueofAmount;
       bool isAmountReceived;
       uint NoofVoters;
       mapping(address=>bool) Voters;
    }

    mapping(uint=>RequestAmount) public RequestAmounts;
    uint public NoofRequestedAmounts;

    constructor(uint _Target, uint _Deadline)
    {
        Target = _Target;
        Deadline = block.timestamp + _Deadline;
        MinimumContribution = 100 wei;
        Manager = msg.sender;
    }

    function SendEther() public payable 
    {
        require(block.timestamp < Deadline, "Deadline has Passed");
        require(msg.value >= MinimumContribution,"Minnimum Contribution is not met");

        if(Contributors[msg.sender]  == 0)
        {
            NoofContributors++;
        }

        Contributors[msg.sender] = Contributors[msg.sender] + msg.value;
        CollectedAmount = CollectedAmount + msg.value;
    }

    function getContractBalance() public view returns(uint)
    {
        return address(this).balance;
    }

    function RefundAmount() public 
    {
        require(block.timestamp < Deadline && CollectedAmount < Target,"The Contributor is not eligible for refund");
        require(Contributors[msg.sender] > 0);
        address payable User = payable(msg.sender);
        Contributors[msg.sender] = 0;
    }

    modifier OnlyManager()
    {
        require(msg.sender == Manager,"only Manager can call this Function");
        _;
    }

    function CreatRequest(string memory _Description,address payable _Recipient,uint _ValueofAmount) public OnlyManager
    {
        RequestAmount storage NewRequest = RequestAmounts[NoofRequestedAmounts];
        NoofRequestedAmounts++;
        NewRequest.Description = _Description;
        NewRequest.Recipient = _Recipient;
        NewRequest.VaueofAmount = _ValueofAmount;
        NewRequest.isAmountReceived = false;
        NewRequest.NoofVoters = 0;
    }

    function VoteRequest(uint _RequestNO) public 
    {
        require(Contributors[msg.sender] > 0,"You must be a Contributor to vote the Type of Request");
        RequestAmount storage ThisVoteRequest = RequestAmounts[_RequestNo];
        require(ThisVoteRequest.Voters[msg.sender]==false,"You have already Voted");
        ThisVoteRequest.NoofVoters++;
    }

    function MakePayment(uint _RequestNO) public OnlyManager
    {
        require(CollectedAmount>=Target);
        RequestAmount storage ThisVoteRequest = RequestAmounts[_RequestNo];
        require(ThisVoteRequest.NoofVoters > NoofContributors/2,"Majority of Contributors does not support";
        ThisVoteRequest.Recipient.transfor(ThisVoteRequest.ValueofAmount);
        ThisVoteREquest.isAmountReceived = true;
    }
}

