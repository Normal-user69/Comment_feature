import 'package:flutter/material.dart';

AppBar customeBar(String txt , bool chat){
  return AppBar(
        title:  Text(txt),
        titleTextStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        actions: [
          if(!chat)
          IconButton(
            icon: Icon(Icons.camera_alt),
            onPressed: () {
              // Camera icon action
            },
          ),
          
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Search icon action
            },
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {
              // 3 dots menu action
            },
          ),
        ],
        bottom: PreferredSize(preferredSize: Size(0,0), child:Container(
          color: const Color.fromARGB(255, 194, 194, 194),
          width: double.infinity,
          height: 1,
        )),
      );
} 

