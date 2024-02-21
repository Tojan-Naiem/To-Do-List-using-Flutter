import 'package:flutter/material.dart';
import 'package:flutter_application_2/model/toDo.dart';
import '../widgets/to_doItems.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

    
class _HomeState extends State<Home> {


  var counter=7;
 final textEditingController = TextEditingController();
 List toDoList=[];
 List<ToDo>foundToDo=ToDo.toDoList;

 void initState(){
  foundToDo=ToDo.toDoList;
  super.initState();
 }

 @override
  Widget build(BuildContext context) {
 return Scaffold(
  backgroundColor: Color.fromARGB(255, 238, 234, 234),
  appBar: _buildAppBar(),
  body:Stack( 
    children:[
    Column(
    children: [ searchBox(),
    Expanded(
      child: ListView(children: [
      Container(
        margin: const EdgeInsets.only(top:50,bottom: 20),
        child: const Text('    All ToDos',style: TextStyle(color: Colors.black,fontSize: 30,fontWeight: FontWeight.w500),),),
        for(var toDo in foundToDo)
        ToDoItems(toDo: toDo),
        
        
    ],
    ) 
    ),
     
  ],
  ),
  Align(alignment: Alignment.bottomCenter,child: Row(children: [
    Expanded(
    child:Container(margin: EdgeInsets.all(10),
    padding:const EdgeInsets.all(3),
    decoration:BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10),boxShadow:const[BoxShadow(color:Colors.grey,blurRadius: 10)]),
    child: TextField(controller: textEditingController,  decoration: InputDecoration(suffixStyle: TextStyle(fontSize: 20,color: Colors.black),  hintText:'  Add a new ToDo item',hintStyle: TextStyle(color: Colors.grey,fontSize: 20,),border: InputBorder.none ),)
   
    )
    ),
    Container(
      margin: EdgeInsets.only(bottom: 2,right: 10),
      
      child:SizedBox(
        height: 50,
        width: 50,
        child:IconButton(
          onPressed: (){setState(() {
            String newText = textEditingController.text.trim();
                      if (newText.isNotEmpty) {
                        setState(() {
                          ToDo newToDo = ToDo( toDoText: newText);
                          toDoList.add(newToDo);
                          ToDo.toDoList.add(newToDo);
                          textEditingController.clear();
                        });
             
                      } 
          
          });
          },
          style: IconButton.styleFrom(backgroundColor: Colors.blue),
          icon:Icon(Icons.add,color: Colors.white,)) ,)
      ,
    )
  ]),)
    ],
  )

);

}
void _runFilter(String enteredKeyboard){
  List<ToDo>results=[];
  if(enteredKeyboard.isEmpty)results=ToDo.toDoList;
  else {
    results=ToDo.toDoList.where((item) => item.toDoText!.toLowerCase().contains(enteredKeyboard.toLowerCase())).toList();
  }
  setState(() {
    foundToDo=results;
  });
}
AppBar _buildAppBar(){
  return AppBar(
    backgroundColor: Color.fromARGB(255, 238, 234, 234),
    title:  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Icon(Icons.menu,color: Colors.black,size: 40,),
        Container (
          height: 40,
          width: 40,
          child: ClipRRect(borderRadius: BorderRadius.circular(20),child:Image.asset('images/man.jpg',height: 70,width: 70,),))
      ]
      ),
  );
}

Widget searchBox(){

return Padding(padding: EdgeInsets.only(top:20,left: 10,right: 10),
  child : Container(
    decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(20)),
    child:  TextField(
      onChanged:(value) => _runFilter(value), decoration: InputDecoration(contentPadding: EdgeInsets.all(10),
           prefixIcon: Icon(Icons.search),border:InputBorder.none,hintText:'Search'),),
    
    
  )
  );
  

  

 


}




}