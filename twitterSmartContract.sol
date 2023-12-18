// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

contract twitter {
uint16 constant MaxTweetLength = 280;


struct Tweet{
    address author;
    string content;
    uint256 timestamp;
    uint256 likes;

}
    mapping(address => Tweet[]) public tweets;

    function createTweet(string  memory _tweet) public{
        require(bytes(_tweet).length <= MaxTweetLength,"tweet too long");
        Tweet memory newTweet= Tweet({
            author: msg.sender,
            content: _tweet,
            timestamp: block.timestamp,
            likes: 0
        });
        tweets[msg.sender].push(newTweet);
    

    }
function get(uint256 _i) public view returns (Tweet memory){
    return tweets[msg.sender][_i];

}
function getAllTweets(address _owner) public view returns (Tweet[] memory){
return tweets[_owner];

}

}
