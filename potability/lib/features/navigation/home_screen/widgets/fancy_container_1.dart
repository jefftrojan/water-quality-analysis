import 'package:flutter/material.dart';
class FancyContainer1 extends StatelessWidget {
  bool safe = false;
  int percentage;
  String time;
  String id;
  Function deleteItem;

  FancyContainer1({super.key, required this.safe, required this.percentage, required this.time, required this.id, required this.deleteItem });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration:  BoxDecoration(
          color: Colors.blueAccent,
          borderRadius: BorderRadius.circular(12),
        ),
        height: 500,
        width: 150,
        child:  Padding(
          padding: const EdgeInsets.fromLTRB(8,0,0,8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("# test $id"),
                  IconButton(onPressed: (){
                      deleteItem(id);
                  }, icon: const Icon(Icons.close_rounded, color: Colors.black,))
                ],),
              Expanded(child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Center(child: safe ? Image.asset("assets/icons/accept.png") : Image.asset("assets/icons/cancel.png") ),
              )),
              Row(children: [const Icon(Icons.water_drop_outlined), Text(" $percentage%", style: TextStyle(fontWeight: FontWeight.bold),), const Text(" Potable")],),
              Row( children: [const Icon(Icons.timer_outlined), Text(" $time", style: TextStyle(fontWeight: FontWeight.bold)),const Text(" Seconds")],),
            ],
          ),
        ),
      ),
    );
  }

}

