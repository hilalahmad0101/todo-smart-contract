
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.22;

struct TodoList{
    address owner;
    string title;
    bool is_completed;
}

contract Todo{ 
    TodoList[] public todoList;


    // add todo 
    function addTodo(string memory title) public {
        TodoList memory todo=TodoList({
            title:title,
            owner:msg.sender,
            is_completed:false
        });

        todoList.push(todo);
    }

    function getAllTodos() public  view returns(TodoList[] memory){
        return todoList;
    }

    function updateTodo(uint ind,string memory title) public {
        // todoList[ind]=TodoList({
        //     title:title,
        //     owner:msg.sender,
        //     is_completed:false
        // });

         todoList[ind].title=title;
    }

    function deleteTodo(uint ind) public {
        todoList[ind]=todoList[todoList.length - 1];
        todoList.pop();
    }

    function completeTodo(uint ind) public {
        todoList[ind].is_completed=true;
    }
}
