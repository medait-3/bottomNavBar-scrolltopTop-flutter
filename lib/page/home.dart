import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class home extends StatefulWidget {
  final ScrollController controllers;
  const home({super.key, required this.controllers});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
 
    List<String> countries = ["USA", "United Kingdom", "China", "Russia", "Brazil",
                              "India", "Pakistan", "Nepal", "Bangladesh", "Sri Lanka",
                              "Japan", "South Korea", "Mongolia", "China", "Russia", "Brazil",
                              "India", "Pakistan", "Nepal", "Bangladesh", "Sri Lanka",
                              "Japan", "South Korea",];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
            title: Text("home"),
            backgroundColor: Colors.green
         ),
        body:
         SingleChildScrollView( 
                  controller: widget.controllers,

      //   controller: _scrollController,

                  // controller: scrollController, //set controller
                  child:Container(
                    child:Column(
                      children: countries.map((country){
                          return Card( 
                            child:ListTile(
                                title: Text(country)
                            )
                          );
                      }).toList(),
                  )
              )
          ), 
    );
  }
}