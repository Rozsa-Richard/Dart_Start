
import 'dart:io';

void main(){
  File file = File("./taborok/taborok.txt");
  List<String> rows = file.readAsLinesSync();
  List<Map<String, dynamic>> taborok =[];
  for (var row in rows) {
    var line = row.split("\t");
    taborok.add({
      "ho_kezd" : int.parse(line[0]),
      "nap_kezd" : int.parse(line[1]),
      "ho_veg" : int.parse(line[2]),
      "nap_veg" : int.parse(line[3]),
      "diak" :  line[4],
      "szakk": line[5]
    });
  }
  stdout.write("Adja meg egy tanuló betűit: ");
  var letter = stdin.readLineSync()!;
  List<String> keresett = [];
  for (var tabor in taborok) {
    if (tabor["diak"].toString().contains(letter)){
      keresett.add('${tabor["ho_kezd"]}.${tabor["nap_kezd"]}-${tabor["ho_veg"]}.${tabor["nap_veg"]} ${tabor["szakk"]}');
    }
  }

  keresett.sort();
  File egytanulo = File(",/taborok/egytanulo.txt");
  egytanulo.writeAsStringSync(keresett.join("\n"));

  
}