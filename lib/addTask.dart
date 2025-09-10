import 'package:flutter/material.dart';

class addTask extends StatefulWidget {
  static const String routeName = '/Addtask';
  const addTask({super.key});

  @override
  State<addTask> createState() => _addTaskState();
}

class _addTaskState extends State<addTask> {
  final TextEditingController titleController=TextEditingController();
    final TextEditingController detailController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
           appBar: AppBar(
        toolbarHeight: 100,
        title: Text("Add Task",style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Color(0xFFFFFFFF)

        ),
        ),
        backgroundColor: Color(0xFF380565),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
      
          children: [
        TextField(
          controller: titleController ,
        decoration: InputDecoration(
          hintText: "Title"
        ),
        ),
        SizedBox(height:30),
        TextField(
        controller: detailController ,
        decoration: InputDecoration(
          hintText: "Detail"
        ),
        ),
        SizedBox(height:60),
            Container(
              width: 386,
              height: 65.07,
              child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF380565),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
                        ),
                      
                        onPressed:(){
                       Navigator.pop(context,{
                        "title":titleController.text,
                         "detail":detailController.text
                       });


                        } ,
                      
                        child: Text(
                         "ADD",
              style: TextStyle(fontSize: 24, color: Colors.white,fontWeight:FontWeight.w600),
                        ),
                      ),
            ),
            
          ],
        ),
      ),
  
    );
  }
}