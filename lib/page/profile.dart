import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.red,
       appBar: AppBar(
            title: Text("home"),
            backgroundColor: Colors.red,
         ),
         body:Center(child:Text("profile",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),))
    );
  }
}