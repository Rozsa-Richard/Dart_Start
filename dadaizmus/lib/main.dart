import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "Dadaizmus",
    home: Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Colors.grey])
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Tóth Albert", style: TextStyle(color: Colors.green),),
            Text("Tartalom(jegyzék)", style: TextStyle(color: Colors.green, fontSize: 30) ),
            Text("Kinyitottam életregényemet, lapoztam", style: TextStyle(color: Colors.green),),
            Text('benne, és a "tartalmas életút" fejezet', style: TextStyle(color: Colors.green),),
            Text("címnél hosszan elidőztem, kissé haboztam,", style: TextStyle(color: Colors.green),),
            Text("ez most sok vagy kevés, vakartam a fejemet", style: TextStyle(color: Colors.green),),
            SizedBox(height: 40,),
            Text("Shantu Norber Naréndra", style: TextStyle(color: Colors.green),),
            Text("(a dadaizmus oltárára)", style: TextStyle(color: Colors.green,fontSize: 30),),
            Text("amit tettem megtettem", style: TextStyle(color: Colors.green),),
            Text('bölcsen sose cselekedtem', style: TextStyle(color: Colors.green),),
            Text("most megemelem kalapom", style: TextStyle(color: Colors.green),),
            Text("ez volt az utolsó szerep...", style: TextStyle(color: Colors.green),),
          ],
        ),
      ),
    )
  ));
}
