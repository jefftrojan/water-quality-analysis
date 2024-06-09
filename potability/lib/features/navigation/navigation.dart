import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:potability/features/navigation/home_screen/home_screen.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  TextEditingController property1Controller = TextEditingController();
  TextEditingController property2Controller = TextEditingController();
  TextEditingController property3Controller = TextEditingController();
  TextEditingController property4Controller = TextEditingController();
  TextEditingController property5Controller = TextEditingController();
  TextEditingController property6Controller = TextEditingController();
  TextEditingController property7Controller = TextEditingController();
  TextEditingController property8Controller = TextEditingController();


  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    property1Controller.dispose();
    property2Controller.dispose();
    property3Controller.dispose();
    property4Controller.dispose();
    property5Controller.dispose();
    property6Controller.dispose();
    property7Controller.dispose();
    property8Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover, image: AssetImage("assets/images/bg.png")),
        ),
        child: const HomeScreen(),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.blue[900],
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              backgroundColor: Colors.indigo.withOpacity(.8),
              icon: Animate(
                effects: const [FadeEffect(), ScaleEffect()],
                child: const Icon(
                  Icons.add_circle_outline_rounded,
                  color: Colors.lightGreen,
                  size: 42,
                ),
              ),
              title: const Column(
                children: [
                  Text(
                    "New Entry",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Go ahead, ask Potability",
                    style: TextStyle(
                      color: Colors.white60,
                      fontSize: 16,
                    ),
                  )
                ],
              ),
              content: Wrap(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 2.0, vertical: 2.0),
                          child: TextField(
                            controller: property1Controller,
                            decoration: const InputDecoration(
                              hintText: 'Property 1',
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(),
                              labelStyle: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            keyboardType: TextInputType.number,
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 2.0, vertical: 2.0),
                          child: TextField(
                            controller: property2Controller,
                            decoration: const InputDecoration(
                              hintText: 'Property 2',
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(),
                              labelStyle: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            keyboardType: TextInputType.number,
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 2.0, vertical: 2.0),
                          child: TextField(
                            controller: property3Controller,
                            decoration: const InputDecoration(
                              hintText: 'Property 3',
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(),
                              labelStyle: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            keyboardType: TextInputType.number,
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 2.0, vertical: 2.0),
                          child: TextField(
                            controller: property4Controller,
                            decoration: const InputDecoration(
                              hintText: 'Property 4',
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(),
                              labelStyle: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            keyboardType: TextInputType.number,
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 2.0, vertical: 2.0),
                          child: TextField(
                            controller: property5Controller,
                            decoration: const InputDecoration(
                              hintText: 'Property 5',
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(),
                              labelStyle: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            keyboardType: TextInputType.number,
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 2.0, vertical: 2.0),
                          child: TextField(
                            controller: property6Controller,
                            decoration: const InputDecoration(
                              hintText: 'Property 6',
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(),
                              labelStyle: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            keyboardType: TextInputType.number,
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 2.0, vertical: 2.0),
                          child: TextField(
                            controller: property7Controller,
                            decoration: const InputDecoration(
                              hintText: 'Property 7',
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(),
                              labelStyle: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            keyboardType: TextInputType.number,
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding:  const EdgeInsets.symmetric(
                              horizontal: 2.0, vertical: 2.0),
                          child: TextField(
                            controller: property8Controller,
                            decoration: const InputDecoration(
                              hintText: 'Property 8',
                              border: OutlineInputBorder(),
                              filled: true,
                              fillColor: Colors.white,
                              labelStyle: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            keyboardType: TextInputType.number,
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    "Cancel",
                    style: TextStyle(color: Colors.red, fontSize: 16),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    submitData();
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    "Submit",
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ),
              ],
            ),
          );
        },
        tooltip: "New Entry",
        elevation: 10,
        label: Text("Ask Potability", style: TextStyle(color: Colors.white),),
        icon: const Icon(Icons.comment_outlined, color: Colors.cyan,),
      ),
    );
  }

  void submitData() async{
    Map<String, dynamic> requestData = {
      "property1": property1Controller.text,
      "property2": property2Controller.text,
      "property3": property3Controller.text,
      "property4": property4Controller.text,
      "property5": property5Controller.text,
      "property6": property6Controller.text,
      "property7": property7Controller.text,
      "property8": property8Controller.text,
    };

    String jsonBody = json.encode(requestData);
    try {
      var response = await http.post(
        Uri.parse('YOUR_API_ENDPOINT_HERE'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonBody,
      );

      if (response.statusCode == 200) {
        var responseData = json.decode(response.body);
      } else {
      }
    } catch (e) {
      print('Error: $e');
    }
  }

}
