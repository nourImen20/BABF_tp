//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract Voting{
    address public owner;
    mapping (string => uint256) public votes; //To follow the number of votes of each singer
    mapping (address => bool) public hasVoted; //To check if a user already voted or not 
    string[] public singers;
    event voted (address indexed voter, string singer); //To know each user  who have casted his vote
    event singerAdded (string singer);  // To notify when the owner add a new singer
    modifier OnlyOwner(){
        require(msg.sender == owner,"Only the contract's owner can add singers.");
        _;
    }
    constructor() {
        owner = msg.sender;
    }
    function addSinger(string memory singer) public OnlyOwner(){
        singers.push(singer);
        emit singerAdded(singer);
    }
    function Vote(string memory singer) public {
        require(!hasVoted[msg.sender],"You have already voted!");
        votes[singer]++;
        hasVoted[msg.sender]=true;
        emit voted(msg.sender,singer);
    }
    function getVoteCount( string memory singer) public view returns(uint256){
        return votes[singer];
    }


}