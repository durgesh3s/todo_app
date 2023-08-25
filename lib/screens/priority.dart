import 'package:flutter/material.dart';

bool selectedPriority1 = false;
bool selectedPriority2 = false;
bool selectedPriority3 = false;

class priority extends StatefulWidget {
  const priority({
    super.key,
  });

  @override
  State<priority> createState() => _PriorityAndCategoryState();
}

class _PriorityAndCategoryState extends State<priority> {
  @override
  Widget build(BuildContext context) {
    // Color priorityColor = const Color.fromARGB(255, 223, 217, 217);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10).copyWith(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 0.0, right: 1.0, left: 8, bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  child: SizedBox(
                    height: 30,
                    width: 111,
                    child: Row(
                      children: [
                        Icon(Icons.priority_high_rounded,color: Colors.black54,),
                        Text('Priority', style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding:
            const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Expanded(
                    child: InkWell(
                      onTap: (){
                        setState(() {
                          selectedPriority1 = true;
                          selectedPriority2 = false;
                          selectedPriority3 = false;
                        });
                      },
                      hoverColor : Colors.blue,
                      borderRadius: BorderRadius.circular(19.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(19.0),
                          color: Colors.black12,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Low', style: TextStyle(color: Colors.black38, fontWeight: FontWeight.bold),),
                        ),
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Expanded(
                    child: InkWell(
                      onTap: (){
                        setState(() {
                          selectedPriority1 = false;
                          selectedPriority2 = true;
                          selectedPriority3 = false;
                        });
                      },
                      hoverColor : Colors.blue,
                      borderRadius: BorderRadius.circular(19.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(19.0),
                          color: Colors.black12,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Medium', style: TextStyle(color: Colors.black38, fontWeight: FontWeight.bold),),
                        ),
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Expanded(
                    child: InkWell(
                      onTap: (){
                        setState(() {
                          selectedPriority1 = false;
                          selectedPriority2 = false;
                          selectedPriority3 = true;
                        });
                      },
                      hoverColor : Colors.blue,
                      borderRadius: BorderRadius.circular(19.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(19.0),
                          color: Colors.black12,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('High', style: TextStyle(color: Colors.black38, fontWeight: FontWeight.bold),),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 0.0, right: 1.0, left: 8, bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  child: SizedBox(
                    height: 30,
                    width: 111,
                    child: Row(
                      children: [
                        Icon(Icons.category,color: Colors.black54,),
                        Text('Categories', style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}