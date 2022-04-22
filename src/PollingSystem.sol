//SPDX-License-Identifer: UNLICENSED

pragma solidity 0.8.6;

contract PollingSystem {

    struct Poll {
        uint16 numOfVotes;
        mapping(string => uint16) choices;
    }

    mapping(address => Poll) polls;

    // Design Architechture.
    // - Create a poll.
    // - Only poll owners can create choices for voters.
    // - Voters can view the choices available, on providing address that owns a poll.
    // - Check ability to vote.
    // - Prevent double voting.

    function createPoll() external {
        Poll storage c = polls[msg.sender];
    }

    function addChoicesToPoll(string memory choice_) external {
        Poll memory _thePoll = polls[];
    }

    function vote() external returns(bool _vote) {

        _vote = true;
    }


    function checkVotePass() internal {

    }

}