import 'dart:io';

void main() {
  File file = File("./fajlolvas/rendel.txt");
  List<String> contents = file.readAsLinesSync();
  List<Map<String, dynamic>> rendelesek = [];
  for(var row in contents){
    var line = row.split(" ");
    rendelesek.add({
      "nap": int.parse(line[0]),
      "tipus": line[1],
      "mennyiseg": int.parse(line[2])
    });
  }

  print("2. feladat: ");
  print("A rendelesek szama: ${rendelesek.length}");
  
  print("3. feladat: ");
  print("Kérem adjon meg egy napot: ");
  int day = int.parse(stdin.readLineSync()!);
  var result = rendelesek.where((x) => x["nap"] == day);
  print("A rendelesek szama az adott napon: ${result.length}");

  print("4. feladat: ");
  var NR = rendelesek.where((x) => x["tipus"] == "NR");
  Set<int> napok = {};
  for(var rendeles in NR){
    napok.add(rendeles["nap"]);
  }
  var calc = 30 - napok.length;
  if (calc == 0) {
    print("minden nap volt");
  }
  print("${calc} nap nem volt rendeles a reklamban nem erintett varosbol");

  print("5. feladat: ");
  var maxDarab = rendelesek[0];
  rendelesek.forEach((rend) {
    if (maxDarab["mennyiseg"] < rend["mennyiseg"])
      maxDarab = rend;
  });
  print("A legnagyobb darabszám: "+ maxDarab["mennyiseg"].toString()+", a rendelés napja: "+ maxDarab["nap"].toString());

  print("7. feladat: ");
  print("A rendelt termékek darabszáma a 21. napon PL: ${osszes("PL", 21, rendelesek)} TV: ${osszes('TV', 21, rendelesek)} NR: ${osszes("NR", 21, rendelesek)}");

  print("8. feladat: ");
  String kimenet = "Napok 1..10 11..20 21..30\n";
  List<int> PLszamok =[];
  List<int> TVszamok =[];
  List<int> NRszamok =[];
  for (var i = 0; i < 31; i++) {
    PLszamok[i ~/ 10] += osszes('PL', i, rendelesek);
    TVszamok[i ~/ 10] += osszes('TV', i, rendelesek);
    NRszamok[i ~/ 10] += osszes('NR', i, rendelesek);
  }
}

int osszes (String varos, int nap, List<Map<String, dynamic>> rendelesek){
  int result = 0;
  rendelesek.forEach((rend) {
    if (rend["tipus"] == varos && rend["nap"] == nap)
      result += rend["mennyiseg"] as int;
  });
  return result;
}