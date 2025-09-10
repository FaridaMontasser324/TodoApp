import 'package:flutter/material.dart';
import 'package:todoapp/addTask.dart';
import 'package:todoapp/completeTask.dart';
import 'package:todoapp/editTask.dart';
import 'package:todoapp/todo.dart';

class todoApp extends StatefulWidget {
  static const String routeName = '/todoApp';
  const todoApp({super.key});

  @override
  State<todoApp> createState() => _todoAppState();
}

class _todoAppState extends State<todoApp> {
  List<todo> todos = [
    todo(title: "todo title", detail: "todo subtitle"),
    todo(title: "todo title", detail: "todo subtitle"),
  ];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: Text(
          "TODO APP",
          style: TextStyle(
            fontWeight: FontWeight.w800,
            color: Color(0xFFFFFFFF),
          ),
        ),
        backgroundColor: Color(0xFF380565),
        centerTitle: true,
      ),
      body: 
      Container(
      padding: EdgeInsets.symmetric(vertical: 20,horizontal:5),
     color: Color(0xFFEDE7F6),
      child: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(height: 12),
        itemCount: todos.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(todos[index].title,style: TextStyle(color: Color(0xFF9395D3),fontWeight: FontWeight.w600)),
              subtitle: Text(todos[index].detail,style: TextStyle(color: Color(0xFF000000),fontWeight: FontWeight.w400)),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () async {
                      final editedTask = await Navigator.pushNamed(
                        context,
                        editTask.routeName,
                      );
                      if (editedTask != null &&
                          editedTask is Map<String, String>) {
                        setState(() {
                          todos[index] = todo(
                            detail: editedTask["detail"] ?? "",
                            title: editedTask["title"] ?? "",
                          );
                        });
                      }
                    },
                    icon: const Icon(Icons.edit_outlined,color: Color(0xFFB3B7EE)),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        todos.removeAt(index);
                      });
                    },
                    icon: const Icon(Icons.delete_outline_rounded,color: Color(0xFFB3B7EE)),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        todos[index].isCompleted = true;
                        
                      });
                    },
                    icon: Icon(Icons.check_circle_outline_outlined,color: todos[index].isCompleted?Color(0xFF380565):Color(0xFFB3B7EE)),
                  ),
                ],
              ),
            ),
          );
        },
      )
      ),

      floatingActionButton: SizedBox(
        width: 70,
        height: 70,
        child: FloatingActionButton(
            shape: const CircleBorder(),
          backgroundColor: Color(0xFF380565),
          child: const Icon(Icons.add,color: Color(0xFFFFFFFF),),
          onPressed: () async {
            final newTask = await Navigator.pushNamed(context, addTask.routeName);
            if (newTask != null && newTask is Map<String, String>) {
              setState(() {
                todos.add(
                  todo(
                    detail: newTask["detail"] ?? "",
                    title: newTask["title"] ?? "",
                  ),
                );
              });
            }
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        backgroundColor: Color(0xFFFFFFFF),
        onTap: (index) {
          if (index == 0) {
            setState(() {
              selectedIndex = 0;
            });
          } else if (index == 1) {
            Navigator.pushNamed(
              context,
              completeTask.routeName,
              arguments: todos,
            );
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'All'),
          BottomNavigationBarItem(
            icon: Icon(Icons.check),
            label: 'Completed',
          ),
        ],
      ),
    );
  }
}
