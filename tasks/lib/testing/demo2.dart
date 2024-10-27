import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class semo2 extends StatelessWidget {
  const semo2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("hello",style: 
        TextStyle(
          color: Colors.black,
          fontSize: 20,
        ),),
      ),
      body: Container(
        child: Text("Hello",style: TextStyle(
          color: Colors.white
        ),),
        height: 200,
        color: Colors.black,
      ),
    );
  }
}