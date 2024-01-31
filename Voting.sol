//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract Voting{
    address public owner;
    mapping (string => uint256) public votes; //To follow the number of votes of each signer
    mapping (address => bool) public hasVoted; //To check if a user already voted or not 
    string[] public signers;
    event voted (address indexed voter, string signer); //To know each user  who have casted his vote
    event signerAdded (string signer);  // To notify when the owner add a new signer
    modifier OnlyOwner(){
        require(msg.sender == owner,"Only the contract's owner can add signers.");
        _;
    }
    constructor() {
        owner = msg.sender;
    }
    function addSigner(string memory signer) public OnlyOwner(){
        signers.push(signer);
        emit signerAdded(signer);
    }
    function Vote(string memory signer) public {
        require(!hasVoted[msg.sender],"You have already voted!");
        votes[signer]++;
        hasVoted[msg.sender]=true;
        emit voted(msg.sender,signer);
    }
    function getVoteCount( string memory signer) public view returns(uint256){
        return votes[signer];
    }


}