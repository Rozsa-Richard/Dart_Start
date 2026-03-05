import 'dart:io';

void main(){
  print("1. feladat");
  File file = File("./viragagyas/felajanlas.txt");
  List<String> con = file.readAsLinesSync();
  List<Map<String,dynamic>> viragagyasok = [];
  int szama = int.parse(con[0]);
  con.removeAt(0);
  for (var r in con){
    var line = r.split(" ");
    viragagyasok.add(({
      "db" : int.parse(line[0]),
      "fela": int.parse(line[1]),
      "szin" : line[2]
    }));

  }
  List<String> ad = [];
  for (var i = 0; i < viragagyasok.length; i++) {
    var szin = viragagyasok[i]["szin"];
    int mettol = viragagyasok[i]["mettol"];
    int meddig = viragagyasok[i]["meddig"];
    for (var j = mettol; i < meddig; j++) {
      if (ad[j].isEmpty)
        ad[j] = "$szin ${i+1}";
    }
  }
}