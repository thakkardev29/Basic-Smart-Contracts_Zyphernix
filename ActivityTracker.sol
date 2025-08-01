// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

contract ActivityTracker {

    struct Workout {
        string activityType;
        uint256 span; 
        uint256 calories;
        uint256 timestamp;
    }

    mapping(address => Workout[]) public userWorkouts;
    mapping(address => uint256) public totalSpan;
    mapping(address => uint256) public workoutCount;

    event WorkoutLogged(
        address indexed user,
        string activityType,
        uint256 span,
        uint256 calories
    );

    event GoalReached(
        address indexed user,
        string goalType,
        uint256 value
    );

    function logWorkout(string memory _type, uint256 _span, uint256 _calories) public {
        require(_span > 0, "Span must be greater than zero");

        userWorkouts[msg.sender].push(Workout(_type, _span, _calories, block.timestamp));
        totalSpan[msg.sender] += _span;
        workoutCount[msg.sender] += 1;

        emit WorkoutLogged(msg.sender, _type, _span, _calories);

        if (workoutCount[msg.sender] == 10) {
            emit GoalReached(msg.sender, "10 Workouts", workoutCount[msg.sender]);
        }
        if (totalSpan[msg.sender] >= 500) {
            emit GoalReached(msg.sender, "500 Minutes", totalSpan[msg.sender]);
        }
    }

    function getUserWorkouts(address user) public view returns (Workout[] memory) {
        return userWorkouts[user];
    }
}
