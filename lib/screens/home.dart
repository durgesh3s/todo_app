import 'package:flutter/material.dart';

import 'categories.dart';
import 'newCategories.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double _currentSliderValue = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => CreateTaskScreen()));
        },
        child: Icon(Icons.add),
      ),

      // Drawer
      drawer: Drawer(
        elevation: 20.0,
        child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Durgesh Singh"),
              accountEmail: Text("durgesh@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.lightGreen,
                child: Text(
                  "D",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            ListTile(
              title: new Text("Todo"),
              leading: new Icon(Icons.note_alt_outlined),
              onTap: () {},
            ),
            Divider(
              height: 0.1,
            ),
            ListTile(
              title: new Text("Remaining"),
              leading: new Icon(Icons.save_alt),
              onTap: () {},
            ),
            ListTile(
              title: new Text("Social"),
              leading: new Icon(Icons.people),
              onTap: () {},
            ),
            ListTile(
              title: new Text("SignOut"),
              leading: new Icon(Icons.output_rounded),
              onTap: () {},
            )
          ],
        ),
      ),
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.grey,
        ),
        elevation: 1,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "CATEGORIES",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ...categoryList.map(
                        (button) => SizedBox(
                      height: 130,
                      width: 200,
                      child: Card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                "1 Task",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black54),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                button.name,
                                style: const TextStyle(fontSize: 24),
                              ),
                            ),
                            Slider(
                              value: _currentSliderValue,
                              max: 100,
                              divisions: 5,
                              label: _currentSliderValue.round().toString(),
                              onChanged: (double value) {
                                setState(() {
                                  _currentSliderValue = value;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: const Text(
                "TASKS TO DO",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  ///uyuy
                  ...newTasksList.map(
                        (button) => Dismissible(
                      key: UniqueKey(),
                      onDismissed: (direction) {
                        setState(() {
                          newTasksList.remove(button);
                        });
                      },
                      background: Container(
                        color: Colors.red,
                        child: const Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(
                                  Icons.delete,
                                  color: Colors.white,
                                ),
                                Icon(
                                  Icons.delete,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      child: SizedBox(
                        height: 100,
                        child: Card(
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Checkbox(
                                      value: button.isSelected,
                                      onChanged: (newBool) {
                                        setState(() {
                                          button.isSelected = newBool!;
                                        });
                                      }),
                                  SizedBox(
                                    width: 230,
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          button.name,
                                          maxLines: null,
                                          style: TextStyle(
                                            fontSize: 18,
                                            decoration: (button.isSelected)
                                                ? TextDecoration.lineThrough
                                                : TextDecoration.none,
                                          ),
                                        ),
                                        Text('Due: ${button.date}, 12:00 Am'),
                                      ],
                                    ),
                                  ),
                                  OutlinedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(12))),
                                    child: Text(
                                      button.priority,
                                      style: const TextStyle(fontSize: 18),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}