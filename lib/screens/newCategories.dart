import 'package:flutter/material.dart';

import '../required/required_homepage_2.dart';
import 'home.dart';


final List<AddCategoryModel> categoryList = [];

class newCategory extends StatefulWidget {
  const newCategory({
    Key? key,
  }) : super(key: key);

  @override
  State<newCategory> createState() => _AddNewCategoryState();
}

class _AddNewCategoryState extends State<newCategory> {
  final TextEditingController categoryTextFieldController =
  TextEditingController();

  void displayDialog(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Enter Your Categories'),
          content: TextField(
            controller: categoryTextFieldController,
            decoration: const InputDecoration(hintText: "Task Category"),
          ),
          actions: [
            TextButton(
              child: const Text('SUBMIT'),
              onPressed: () {
                setState(() {
                  final newCategory = AddCategoryModel(
                    id: DateTime.now().toString(),
                    name: categoryTextFieldController.text,
                  );
                  categoryList.add(newCategory);
                  categoryTextFieldController.text = "";
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void removeCategory(AddCategoryModel category) {
    setState(() {
      categoryList.remove(category);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10).copyWith(top: 15),
      child: Wrap(
        spacing: Checkbox.width,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Expanded(
              child: InkWell(
                onTap: () => displayDialog(context),
                borderRadius: BorderRadius.circular(19.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(19.0),
                    color: Colors.black12,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('+ Add New Categories', style: TextStyle(color: Colors.black38, fontWeight: FontWeight.bold),),
                  ),
                ),
              ),
            ),
          ),
          ...categoryList.map((button) => InputChip(
            onDeleted: () {
              removeCategory(button);
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (_) => const HomeScreen()));
            },
            backgroundColor: Colors.black12,
            labelStyle: TextStyle(color: Colors.black38, fontWeight: FontWeight.bold),
            label: Text(button.name),
          )),
        ],
      ),
    );
  }
}