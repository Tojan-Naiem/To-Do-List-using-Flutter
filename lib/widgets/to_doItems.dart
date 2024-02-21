import 'package:flutter/material.dart';
import 'package:flutter_application_2/model/toDo.dart';
  
class ToDoItems extends StatefulWidget {
  final ToDo toDo;

  ToDoItems({Key? key, required this.toDo}) : super(key: key);

  @override
  _ToDoItemsState createState() => _ToDoItemsState();
}

class _ToDoItemsState extends State<ToDoItems> {
  @override


   
  Widget build(BuildContext context){

   if(widget.toDo.isRemoved ==true){
    return SizedBox();
   }
   else {
    return Container(
      // margin: const EdgeInsets.only(bottom: 10),
      child: Padding(padding: EdgeInsets.only(left: 20,right: 20,bottom: 20),
      child:ListTile(
        onTap: (){

          setState(() {
            widget.toDo.isDone=!widget.toDo.isDone;
          });

        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        tileColor: Colors.white,
        leading:  Icon(widget.toDo.isDone?Icons.check_box:Icons.check_box_outline_blank ,color: Color.fromARGB(255, 14, 30, 205),),
        title: Text(widget.toDo.toDoText.toString(),style: TextStyle(color: Colors.black,fontSize: 20,decoration:widget.toDo.isDone?TextDecoration.lineThrough:null),),
        trailing: IconButton(onPressed: (){
          setState(() {
           widget.toDo.isRemoved=true;
          });
          
       
  }, icon:const Icon(Icons.delete,color: Colors.red,),),
      ),
       ) 
    );

  }

}}