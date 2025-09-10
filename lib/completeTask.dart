import 'package:flutter/material.dart';
import 'package:todoapp/todoApp.dart';
import 'package:todoapp/todo.dart';
class completeTask extends StatelessWidget {
  static const String routeName = '/completeTask';
  const completeTask({super.key});

  @override
  Widget build(BuildContext context) {
    final todos=ModalRoute.of(context)!.settings.arguments as List<todo>;
    final completedTodos=todos.where((t)=>t.isCompleted).toList();
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: Text("Completed Task",style: TextStyle(
            fontWeight: FontWeight.w600,
              color: Color(0xFFFFFFFF)

        ),
        ),
        backgroundColor: Color(0xFF380565),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20,horizontal:5),
     color: Color(0xFFEDE7F6),
        child: ListView.separated(
          separatorBuilder: (context, index) => SizedBox(height: 12),
          itemCount: completedTodos.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text(completedTodos[index].title,style: TextStyle(color: Color(0xFF9395D3),fontWeight: FontWeight.w600)),
                subtitle: Text(completedTodos[index].detail,style: TextStyle(color: Color(0xFF000000),fontWeight: FontWeight.w400)),
                
              ),
            );
          },
        ),
      ),

    );
  }
}