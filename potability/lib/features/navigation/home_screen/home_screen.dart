import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:potability/features/navigation/home_screen/widgets/fancy_container_1.dart';
import 'package:potability/utils/env.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:potability/utils/ourdata.dart';

class HomeScreen extends StatefulWidget {
  List<Map<String, dynamic>> potability_data;
  HomeScreen({super.key, required this.potability_data});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool previousEntries = false;


  
  void deleteItem(String id) {
    setState(() {
      widget.potability_data.removeWhere((item) => item['id'] == id);

    });
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      if(widget.potability_data.isNotEmpty){
        previousEntries = true;
      }
      widget.potability_data = Data.potability_data;
    });

  }how

  @override
  Widget build(BuildContext context) {
    setState(() {
      if(widget.potability_data.isNotEmpty){
        previousEntries = true;
      }
      else{
        previousEntries = false;
      }
    });
    return RefreshIndicator(
      onRefresh: ()async{
        await Future.delayed(const Duration(seconds: 3));
        setState(() {
        });
      },
      child: Scaffold(
        backgroundColor: Colors.indigo,
        body: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height* .85,
            child: Stack(
              children:[
            Container(
            child: Lottie.asset("assets/animations/waters.json")),
                Padding(
                padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[

                    const SizedBox(
                      height: 20,
                    ),
                    Expanded(child:
                    Column(
                      children: [
                        Expanded(child: Container(
                            child: widget.potability_data.isEmpty ? Lottie.asset("assets/animations/waterfall_animation.json") :
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
                        SizedBox(
                          height: 200,
                          width: MediaQuery.of(context).size.width,
                          child: Builder(
                              builder: (context) {
                                return Animate(
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: widget.potability_data.length,
                                    itemBuilder: (context, index) {
                                      return FancyContainer1(
                                        safe: widget.potability_data[index]['safe'],
                                        percentage: widget.potability_data[index]['percentage'],
                                        time: widget.potability_data[index]['time'],
                                        id: widget.potability_data[index]['id'], deleteItem: deleteItem,
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
        ),
      ),
    );
  }
}


