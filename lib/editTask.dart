import 'package:flutter/material.dart';
import 'package:todoapp/todoApp.dart';

class editTask extends StatefulWidget {
  static const String routeName = '/editTask';
  const editTask({super.key});

  @override
  State<editTask> createState() => _editTaskState();
}
class _editTaskState extends State<editTask> {
final TextEditingController titleController2=TextEditingController();
final TextEditingController detailController2=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: Text(
          "Edit Task",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Color(0xFFFFFFFF),
          ),
        ),
        backgroundColor: Color(0xFF380565),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(decoration: InputDecoration(hintText: "Title"),
            controller: titleController2,
            ),
            SizedBox(height: 30),
            TextField(decoration: InputDecoration(hintText: "Detail"),
            controller: detailController2,
            ),
            SizedBox(height: 60),
            Container(
              child: Row(
                children: [
                  Container(
                    height:65 ,
                    width: 170,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF380565),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    
                      onPressed: () {
                        Navigator.pop(context,{
                        "title":titleController2.text,
                         "detail":detailController2.text
                       });
                      },
                    
                      child: Text(
                        "Update",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 30),
                  Container(
                      height:65 ,
                    width: 170,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF9395D3),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    
                      child: Text(
                        "Cancel",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
