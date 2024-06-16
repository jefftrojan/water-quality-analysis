import 'dart:convert';
import 'dart:math';
import 'dart:ui';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';
import 'package:hidden_drawer_menu/model/item_hidden_menu.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:potability/features/metrics/metrics.dart';
import 'package:potability/features/navigation/home_screen/home_screen.dart';
import 'package:potability/utils/ourdata.dart';
import 'package:tflite_flutter/tflite_flutter.dart' as tfl;

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
  TextEditingController property9Controller = TextEditingController();
  List<ScreenHiddenDrawer> _pages = [];

  void rebuildHome(){
    setState(() {
    });
  }
  @override
  void initState() {
    super.initState();
    Data.potability_data;
    _pages = [
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: 'Home',
          baseStyle: const TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
              fontSize: 18
          ),
          selectedStyle: const TextStyle(
              color: Colors.lightBlueAccent,
              fontWeight: FontWeight.bold,
              fontSize: 20
          ),
            colorLineSelected: Colors.green
        ),
        Scaffold(
          backgroundColor: Colors.blueAccent,
          resizeToAvoidBottomInset: true,
          body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover, image: AssetImage("assets/images/bg.png")),
            ),
            child: HomeScreen(potability_data: Data.potability_data,),
          ),
          floatingActionButton: FloatingActionButton.extended(
            backgroundColor: Colors.blue[900],
            onPressed: () {
              buildShowDialog(context);
            },
            tooltip: "New Entry",
            elevation: 10,
            label: const Text(
              "Ask Potability",
              style: TextStyle(color: Colors.white),
            ),
            icon: const Icon(
              Icons.comment_outlined,
              color: Colors.cyan,
            ),
          ),
        ),
      ),
      ScreenHiddenDrawer(ItemHiddenMenu(
        name: 'Metrics',
        baseStyle: const TextStyle(
          color: Colors.blue,
          fontWeight: FontWeight.bold,
          fontSize: 18
        ),
        selectedStyle: const TextStyle(
            color: Colors.lightBlueAccent,
            fontWeight: FontWeight.bold,
            fontSize: 20
        ),
        colorLineSelected: Colors.green
      ),const Metrics() )
    ];
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
    property9Controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return HiddenDrawerMenu(
      contentCornerRadius: 18,
      isTitleCentered: false,
      withAutoTittleName: true,
      styleAutoTittleName:
      TextStyle(color: Colors.limeAccent, fontWeight: FontWeight.bold),
      leadingAppBar: const Icon(
        Icons.menu,
        color: Colors.cyan,
      ),
      backgroundColorContent: Colors.indigoAccent,
      backgroundColorAppBar: Colors.indigo,
      screens: _pages,
      backgroundColorMenu: Colors.indigoAccent,
      slidePercent: 40,
    );
  }

  buildShowDialog( context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        actionsOverflowButtonSpacing: 500,
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
              "Fill in the water constituents",
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
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        hintText: 'PH',
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
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        hintText: 'Hardness',
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
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        hintText: 'Solids',
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
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        hintText: 'Chloramines',
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
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        hintText: 'Sulfate',
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
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        hintText: 'Conductivity',
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
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        hintText: 'Organic Carbon',
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
                      controller: property8Controller,
                      decoration: const InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        hintText: 'Trihalomethanes',
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
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 2.0, vertical: 2.0),
                    child: TextField(
                      controller: property9Controller,
                      decoration: const InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        hintText: 'Turbidity',
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
            )
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
              processData();
              Navigator.of(context).pop();
              final homeScreen = context.findAncestorWidgetOfExactType<HomeScreen>();
              homeScreen?.createState().setState(() {
                
              });
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
  }

  void processData() async {
    String property1 = property1Controller.text;
    String property2 = property2Controller.text;
    String property3 = property3Controller.text;
    String property4 = property4Controller.text;
    String property5 = property5Controller.text;
    String property6 = property6Controller.text;
    String property7 = property7Controller.text;
    String property8 = property8Controller.text;
    String property9 = property9Controller.text;

    // Load the TFLite model
    final interpreter =
        await tfl.Interpreter.fromAsset('assets/models/model_l1.tflite');

    // Prepare input as required by your model
    List<double> inputList = [
      double.parse(property1),
      double.parse(property2),
      double.parse(property3),
      double.parse(property4),
      double.parse(property5),
      double.parse(property6),
      double.parse(property7),
      double.parse(property8),
      double.parse(property9),
    ];

    // Prepare output set and use reshape method from the plugin.
    var output = List.filled(1, 0).reshape([1, 1]);

    interpreter.run(inputList, output);
    var result = output[0][0];
    Data.potability_data.add({
      'safe': result > 0.5,
      'percentage': (result * 100).toInt(),
      'time': DateTime.now().second.toString(),
      'id': Data.potability_data.length.toString(),
    });
  }
}
