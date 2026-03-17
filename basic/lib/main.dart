import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "Alap widgetek",
    home: Scaffold(
        body: Container(
          child: Center(child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Szistok", style: TextStyle(color: Colors.black, fontSize: 23),),
              Text("Szistok", style: TextStyle(color: Colors.black, fontSize: 23),),
              Text("Szistok", style: TextStyle(color: Colors.black, fontSize: 23),),
              SizedBox(height: 40,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: double.maxFinite,
                children: [
                  Text("data"),
                  SizedBox(width: 20,),
                  Text("dat1"),
                  Text("data2"),
                  Text("data33"),
                ],
              )
            ],
          )),
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Colors.cyan, Color.fromRGBO(120, 23, 231, 0)], begin: AlignmentGeometry.bottomRight, end:AlignmentGeometry.center),
        )
        )
      ),
  ));
}

