import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class form extends StatelessWidget {
  const form({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _tasknameController = TextEditingController();
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    final TextEditingController _dateController = TextEditingController();

    Future<void> _saveTasks(String taskname, String date) async {
      print('Saving task: $taskname with date: $date');
      try {
        await _firestore
            .collection('tasks')
            .add({'taskname': taskname, 'date': date});
        print("Data Saved");
      } catch (e) {
        print("Error Occurred $e");
      }
    }

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 144, 144, 144),
      appBar: AppBar(
        title: Text("Add new Task"),
        backgroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: _tasknameController,
                  style: const TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                      label: Text("Name of the task"),
                      labelStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                ),
                SizedBox(
                  height: 50,
                ),
                TextField(
                  controller: _dateController,
                  style: const TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                      label: Text("Deadline (dd/mm/yyyy) format"),
                      labelStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                ),
                ElevatedButton(
                  onPressed: () async {
                    await _saveTasks(
                        _tasknameController.text, _dateController.text);
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Data Saved Successfully")));
                    Navigator.pushNamed(context, '/tasks');
                  },
                  child: Icon(Icons.check),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
