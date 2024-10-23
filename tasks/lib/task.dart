import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Task extends StatefulWidget {
  const Task({super.key});

  @override
  _TaskState createState() => _TaskState();
}

class _TaskState extends State<Task> {
  List<Map<String, String>> tasks = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getTasks();
  }

  Future<void> getTasks() async {
    CollectionReference tasksCollection =
        FirebaseFirestore.instance.collection('tasks');
    QuerySnapshot querySnapshot = await tasksCollection.get();

    List<Map<String, String>> tempTasks = [];
    for (var doc in querySnapshot.docs) {
      String name = doc.get('taskname');
      String date = doc.get('date');
      tempTasks.add({name: date});
    }

    setState(() {
      tasks = tempTasks;
      isLoading = false;
    });
  }

  Future<void> deleteTask(String name) async {
    CollectionReference tasksCollection =
        FirebaseFirestore.instance.collection('tasks');

    QuerySnapshot snapshot =
        await tasksCollection.where('taskname', isEqualTo: name).get();
    for (var doc in snapshot.docs) {
      await tasksCollection.doc(doc.id).delete();
    }

    setState(() {
      tasks.removeWhere((task) => task.keys.first == name);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(2, 195, 191, 191),
      appBar: AppBar(
        title: const Text(
          "Tasks",
          style: TextStyle(
            color: Colors.black,
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Column(
        children: [
          // Use Expanded to ensure ListView takes the available space
          Expanded(
            child: tasks.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: tasks.length,
                    itemBuilder: (context, index) {
                      Map<String, String> task = tasks[index];
                      return Card(
                        color: Colors.white,
                        margin: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Taskname: ${task.keys.first}',
                              style: const TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text('Deadline: ${task.values.first}'),
                            const SizedBox(height: 10),
                            FloatingActionButton.extended(
                              label: const Text("Delete"),
                              backgroundColor: Colors.red,
                              icon: const Icon(Icons.delete),
                              onPressed: () => deleteTask(task.keys.first),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: FloatingActionButton.extended(
                onPressed: () {
                  Navigator.pushNamed(context, '/form');
                },
                label: const Text(""),
                icon: const Icon(Icons.add),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
