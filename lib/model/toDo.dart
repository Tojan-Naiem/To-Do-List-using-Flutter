class ToDo{

  
  String? toDoText;
  bool isDone=false;
  static List<ToDo>toDoList=[];
  bool isRemoved=false;
  ToDo({
    required this.toDoText,
    this.isDone=false,
    this.isRemoved=false,

  });



}