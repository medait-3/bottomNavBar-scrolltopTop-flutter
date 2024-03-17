import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class message extends StatefulWidget {
  const message({super.key});

  @override
  State<message> createState() => _messageState();
}

class _messageState extends State<message> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.grey,
       appBar: AppBar(
            title: Text("message"),
            backgroundColor: Colors.grey
         ),
        body:Center(child:Text("message",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),))
    );
  }
}