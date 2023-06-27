import 'package:fitify/utils.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  buildTab(String text, bool selected) {
    return Padding(
      padding: const EdgeInsets.only(right: 5.0),
      child: Chip(
        elevation: 10,
        backgroundColor: Colors.redAccent,
        label: Text(
          text,
          style: textStyle(18, Colors.white, FontWeight.w700),
        ),
      ),
    );
  }

  openAddDialog(context) {
    return showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: Container(
              height: 220,
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Column(
                  children: [
                    Text(
                      "Add",
                      style: textStyle(28, Colors.black, FontWeight.w700),
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        Container(
                          width: 125,
                          height: 40,
                          child: TextFormField(
                            style: textStyle(20, Colors.black, FontWeight.w500),
                            decoration: const InputDecoration(
                              hintText: "In kg",
                              border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 1, color: Colors.black),
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFBF5F5),
      floatingActionButton: Chip(
        backgroundColor: Colors.redAccent,
        onDeleted: () => openAddDialog(context),
        deleteIcon: const Icon(
          Icons.add,
          color: Colors.white,
          size: 26,
        ),
        label: Text(
          "Add",
          style: textStyle(22, Colors.white, FontWeight.w600),
        ),
      ),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(top: 50.0),
          child: Column(
            children: [
              Text(
                'Fit',
                style: textStyle(45, Colors.black, FontWeight.w600),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  children: [
                    buildTab("All", true),
                    buildTab("Weight", true),
                    buildTab("Height", true)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20),
                child: ListView.builder(
                  itemCount: 3,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 6.0),
                      child: Card(
                        elevation: 30,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: ListTile(
                            leading: const Image(
                              width: 50,
                              height: 50,
                              image: AssetImage('assets/bundo.jpg'),
                              fit: BoxFit.cover,
                            ),
                            title: Text(
                              "65 kg",
                              style:
                                  textStyle(27, Colors.black, FontWeight.w600),
                            ),
                            trailing: const Icon(
                              Icons.delete,
                              color: Colors.redAccent,
                              size: 28,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
