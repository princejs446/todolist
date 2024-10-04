import 'package:flutter/material.dart';
class ToDoListScreen extends StatefulWidget{
  @override  
  _ToDoListScreenState createState()=>_ToDoListScreenState();
}
class _ToDoListScreenState extends State<ToDoListScreen>{
  TextEditingController _controller=TextEditingController();
  List<String>todoItems=[];
  void _addToDoItem(){
    setState((){
      if (_controller.text.isNotEmpty){
        todoItems.add(_controller.text);
        _controller.clear();
      }
    });
  }
  void _removeToDoItem(int index){
    setState((){
      todoItems.removeAt(index);
    });
  }
  @override  
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("TO DO List"),
      ),
      body: Column(
        children: [
          Padding(padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child:TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                  border:OutlineInputBorder(),hintText:'Enter a task'
                ),
                ),
                  ),
                  IconButton(icon:Icon(Icons.add),onPressed: _addToDoItem,
                  ),
            ],
                ),
          ),
          Expanded(child: ListView.builder(
            itemCount: todoItems.length,
            itemBuilder: (context,index){
              return ListTile(
                title: Text(todoItems[index]),
                trailing: IconButton(onPressed: (){
                  _removeToDoItem(index);

                },
                 icon: Icon(Icons.delete)),
              );
            },
            ),
            ),
        ],
          ),
          
          );
  }
}