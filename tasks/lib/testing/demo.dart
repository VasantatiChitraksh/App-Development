import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class demo extends StatefulWidget {
  const demo({super.key});
  @override
  _demostate createState() => _demostate();
}

class _demostate extends State<demo> {
  List<int> map = [4, 5];

  void getnums() {
    map.add(1);
    map.add(2);

    print(map[0] + map[1]);

    setState(() {
      map = [1, 3, 4];
    });
  }

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   body: Column(
    //     children: [
    //       FloatingActionButton.extended(
    //         label: Text("Button1"),
    //         onPressed: () {
    //           Navigator.pushNamed(context, '/tasks');
    //         },
    //       ),
    //       ElevatedButton(
    //           onPressed: () {
    //             Navigator.pushNamed(context, '/tasks');
    //           },
    //           child: Icon(Icons.task)),
    //       OutlinedButton(
    //           onPressed: () {
    //             Navigator.pushNamed(context, '/tasks');
    //           },
    //           child: Text("Hello"))
    //     ],
    //   ),
    // );
    // return Scaffold(
    //   body: ListView.builder(
    //       itemCount: 5,
    //       itemBuilder: (context, index) {
    //         return Card(
    //           color: Colors.black,
    //           child: Column(
    //             children: [
    //               Text(
    //                 "Hello the value is ${index}",
    //                 style: TextStyle(
    //                   color: Colors.white,
    //                   fontSize: 25,
    //                 ),
    //               )
    //             ],
    //           ),
    //         );
    //       }),
    // );
    return GestureDetector(
      child: Scaffold(),
      onTap: () {
        Navigator.pushNamed(
          context,
          '/tasks',
        );
      },
      onDoubleTap: () {
        Navigator.pushNamed(context, '/form');
      },
    );
  }
}
