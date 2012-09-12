Client = require('../common/test/client').Client
client = new Client("http://localhost:8888/")


# Remove all todolists and tree from DB.
exports.cleanDb = (callback) ->
    TodoList.destroyAll ->
        Tree.destroyAll ->
            Task.destroyAll callback

# Create a new todo list.
exports.createTodoListFunction = (title, path) ->
    (callback) ->
        todolist =
            title: title
            path: path

        TodoList.create todolist, callback

exports.createFullTodoListFunction = (title, path) ->
    (callback) ->
        todolist =
            title: title
            path: path

        client.post "todolists/", todolist, callback
        
exports.createTaskFunction = (list, done, description) ->
    (callback) ->
        task =
            list: list
            done: done
            descrption: description

        Task.create task, callback
        
