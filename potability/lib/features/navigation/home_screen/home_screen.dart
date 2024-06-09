import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:potability/features/navigation/home_screen/widgets/fancy_container_1.dart';
import 'package:potability/utils/env.dart';
import 'package:flutter_animate/flutter_animate.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool previousEntries = false;
  List<Map<String, dynamic>> data = [
    {
      'safe': false,
      'percentage': 20,
      'time': '20.4',
      'id': '4'
    },
    {
      'safe': true,
      'percentage': 67,
      'time': '43.1',
      'id': '3'
    },
    {
      'safe': true,
      'percentage': 56,
      'time': '25.0',
      'id': '2'
    },
    {
      'safe': true,
      'percentage': 90,
      'time': '25.7',
      'id': '1'
    },
  ];
  
  void deleteItem(String id) {
    setState(() {
      data.removeWhere((item) => item['id'] == id);
      if(data.isEmpty){
        previousEntries = false;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      if(data.isNotEmpty){
        previousEntries = true;
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: ()async{
        await Future.delayed(const Duration(seconds: 3));
        setState(() {
        });
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          actions: [Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: IconButton(
              onPressed: () {  }, icon:  Icon(Icons.menu),),
          )],
          title: Animate(
            child: Text("Welcome Back,",
              style: TextStyle(
                  color: MyConstants.titleColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 24
              ),).animate().slideX(),
          ),
        ),
        body: Stack(
          children:[
        Container(
        child: Lottie.asset("assets/animations/waters.json")),
            Padding(
            padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Potability Missed you!",
                  style: TextStyle(fontSize: 18, color: MyConstants.titleColor2, fontWeight: FontWeight.bold),
                ),
                Text("We're rewriting reality with Ai. is your water safe? let's find out!",
                  style: TextStyle(fontSize: 16, color: MyConstants.textColor, fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(child:
                Column(
                  children: [
                    Expanded(child: Container(
                        child: data.isEmpty ? Lottie.asset("assets/animations/waterfall_animation.json") :
                        Lottie.asset("assets/animations/waiting.json")
                    )),
                  ],
                )),
                Visibility(
                  visible: previousEntries,
                  child: Column(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Text("Previous entries",
                        style: TextStyle(fontSize: 16, color: MyConstants.textColor, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      child: Builder(
                          builder: (context) {
                            return Animate(
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: data.length,
                                itemBuilder: (context, index) {
                                  return FancyContainer1(
                                    safe: data[index]['safe'],
                                    percentage: data[index]['percentage'],
                                    time: data[index]['time'],
                                    id: data[index]['id'], deleteItem: deleteItem,
                                  );
                                },
                              ).animate().slideX(),
                            );
                          }
                      ),
                    ),
                  ],
                )),
                Visibility(
                  visible: !previousEntries,
                  child: Column(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Text("About Potability",
                        style: TextStyle(fontSize: 20, color: MyConstants.textColor, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.horizontal(left: Radius.circular(12)),
                        border: Border(left: BorderSide(color: Colors.indigoAccent, width: 10)),
                      ),
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            """Some Lorem ipsum about potability Some Lorem ipsum about potability \n\nInstructions:\nJust click on the floating button to add a new entry!""",
                            style: TextStyle(fontSize: 14, color: Colors.white60),
                          ),
                        )),
                    SizedBox(height:35,)
                  ],
                )),
                const SizedBox(height: 10,)
              ],
            ),
          ),]
        ),
      ),
    );
  }
}


