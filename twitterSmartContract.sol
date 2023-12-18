// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

// 1️⃣ Add id to Tweet Struct to make every Tweet Unique
// 2️⃣ Set the id to be the Tweet[] length 
// HINT: you do it in the createTweet function
// 3️⃣ Add a function to like the tweet
// HINT: there should be 2 parameters, id and author
// 4️⃣ Add a function to unlike the tweet
// HINT: make sure you can unlike only if likes count is greater then 0
// 4️⃣ Mark both functions external
contract twitter {
uint16 public MaxTweetLength = 280;
 address public owner;

struct Tweet{
    uint256 id;
    address author;
    string content;
    uint256 timestamp;
    uint256 likes;

}
constructor() {
        owner = msg.sender;
    }

    mapping(address => Tweet[]) public tweets;

    modifier onlyOwner() {
        require(msg.sender == owner, " you are not the owner");
        _;
    }

    function createTweet(string  memory _tweet) public{
        require(bytes(_tweet).length <= MaxTweetLength,"tweet too long");
        Tweet memory newTweet= Tweet({
            id: tweets[msg.sender].length,
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
function changeTweetLength(uint16 newTweetLength) public onlyOwner{
  MaxTweetLength = newTweetLength;
}
function addLike(address author,uint256 id) external{
    require(tweets[author][id].id== id, "tweet doesn't exist");
    tweets[author][id].likes++;

}
function removeLike(address author,uint256 id) external{
        require(tweets[author][id].id== id, "tweet doesn't exist");
    require(tweets[author][id].likes > 0, "you should like the post before");

       tweets[author][id].likes--;
}

}
