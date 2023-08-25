import 'dart:developer';

import 'package:flutter/material.dart';

import '../required/required_categories.dart';
import 'home.dart';
import 'priority.dart';
import 'newCategories.dart';


final List<AddNewTasks> newTasksList = [];

class CreateTaskScreen extends StatefulWidget {
  const CreateTaskScreen({super.key});

  @override
  State<CreateTaskScreen> createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends State<CreateTaskScreen> {
  bool? isChecked1 = false;

  @override
  Widget build(BuildContext context) {
    TextEditingController newTaskTitle = TextEditingController();
    DateTime? datePicked;
    // List<Widget> categoryButtons = [];

    return Scaffold(
      floatingActionButton: Builder(
        builder: (context) => ElevatedButton(
          style: ElevatedButton.styleFrom(
              elevation: 2,
              fixedSize: const Size.fromWidth(121),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              backgroundColor: Colors.blueAccent),
          onPressed: () {
            if (datePicked == null && newTaskTitle.text == "") {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Please give a title and pick a date")));
            } else if (newTaskTitle.text == "") {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Please give a title")));
            } else if (datePicked == null) {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Please pick a date first")));
            } else if (selectedPriority1 == false &&
                selectedPriority2 == false &&
                selectedPriority3 == false) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Please select a priority first")));
            } else {
              setState(() {
                newTasksList.add(AddNewTasks(
                    isSelected: false,
                    date: (datePicked != null)
                        ? "${datePicked!.day}, ${datePicked!.month}, ${datePicked!.year}"
                        : "null",
                    priority: (selectedPriority1)
                        ? "Low"
                        : (selectedPriority2)
                        ? "Medium"
                        : "High",
                    id: DateTime.now().toString(),
                    name: newTaskTitle.text));

                selectedPriority1 = false;
                selectedPriority2 = false;
                selectedPriority3 = false;

                newTaskTitle.text = "";
              });

              // if (selectedPriority1 == true) {
              //   priorityName = "Low";
              // } else if (selectedPriority2 == true) {
              //   priorityName = "Medium";
              // } else if (selectedPriority3 == true) {
              //   priorityName = "High";
              // }

              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (_) => const HomeScreen()));
            }
          },
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "New Task",
                style: TextStyle(color: Colors.black),
              ),
              Icon(
                Icons.keyboard_arrow_up_sharp,
                color: Colors.black,
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.grey,
          ),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomeScreen()));
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Create Task",
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: 31,
                        fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 10).copyWith(top: 20),
              child: TextField(
                controller: newTaskTitle,
                maxLines: null,
                decoration: const InputDecoration(
                    hintText: "Enter Task Information",
                    hintStyle: TextStyle(
                        color: Colors.black38, fontSize: 18, letterSpacing: 1),
                    border: InputBorder.none),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, right: 3.0, left: 8, bottom: 2),
              child: Card(
                child: SizedBox(
                  height: 30,
                  width: 95,
                  child: InkWell(
                    onTap: ()async {
                        datePicked = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2080));

                        log("$datePicked");

                    },
                    child: Row(
                      children: [
                        Icon(Icons.date_range,color: Colors.black54,),
                        Text('Due Date', style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            Padding(
              padding:
              const EdgeInsets.only( top: 8, bottom: 8, right: 0, left: 1),
              child: Row(
                children: [
                  Checkbox(
                      value: isChecked1,
                      onChanged: (newBool) {
                        setState(() {
                          isChecked1 = newBool;
                        });
                      }),
                  const Text(
                    "Completed",
                    style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const priority(),
            const newCategory(),
          ],
        ),
      ),
    );
  }
}