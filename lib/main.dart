import 'package:flutter/material.dart';
import 'package:todoapp/completeTask.dart';
import 'package:todoapp/editTask.dart';
import 'package:todoapp/todoApp.dart';
import 'package:todoapp/addTask.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
     const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
        return MaterialApp(
           debugShowCheckedModeBanner: false,
         routes: {
  todoApp.routeName:(_)=>todoApp(),
  addTask.routeName:(_)=>addTask(),
    editTask.routeName:(_)=>editTask(),
      completeTask.routeName:(_)=>completeTask(),
 },
      initialRoute: todoApp.routeName,

        

        );
  }
 

}

