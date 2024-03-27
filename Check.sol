// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Checklist {
    struct Task {
        uint id;
        string content;
        bool isCompleted;
    }

    mapping(uint => Task) public tasks;
    uint public taskCount;

    // Function to add a new task
    function addTask(string memory content) external {
        // Ensures the task content is not empty
        require(bytes(content).length > 0, "Task content cannot be empty");

        // Increments the task count and adds the task to the mapping
        taskCount++;
        tasks[taskCount] = Task(taskCount, content, false);
    }

    // Function to mark a task as complete
    function markTaskComplete(uint taskId) external {
        // Ensures the task exists
        require(taskId > 0 && taskId <= taskCount, "Task does not exist");

        // Retrieves the task and ensures it's not already completed
        Task storage task = tasks[taskId];
        require(!task.isCompleted, "Task already completed");

        // Marks the task as completed
        task.isCompleted = true;
    }

    // Function to remove a completed task
    function removeTask(uint taskId) external {
        // Ensures the task exists
        require(taskId > 0 && taskId <= taskCount, "Task does not exist");

        // Asserts that the task is completed before removing it
        assert(tasks[taskId].isCompleted);

        // Deletes the task from the mapping
        delete tasks[taskId];
    }

    // Function to update a task's content
    function updateTask(uint taskId, string memory newContent) external {
        // Ensures the task exists
        require(taskId > 0 && taskId <= taskCount, "Task does not exist");

        // Retrieves the task and ensures it's not completed
        Task storage task = tasks[taskId];
        require(!task.isCompleted, "Cannot update a completed task");

        // Ensures the new content is not empty
        require(bytes(newContent).length > 0, "New content cannot be empty");

        // Updates the task content
        task.content = newContent;
    }

    // Function to get details of a specific task
    function getTaskDetails(uint taskId) external view returns (Task memory) {
        // Ensures the task exists
        require(taskId > 0 && taskId <= taskCount, "Task does not exist");

        // Returns the details of the task
        return tasks[taskId];
    }

    // Function to get the total number of tasks
    function getTotalTasks() external view returns (uint) {
        // Returns the total task count
        return taskCount;
    }

    // Function to demonstrate revert
    function demonstrateRevert() external pure {
        // Throws an error with the specified message
        revert("This function always reverts");
    }
}
