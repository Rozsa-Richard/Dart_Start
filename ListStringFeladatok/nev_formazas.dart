import 'dart:io';

void main() {
  print("Addj meg egy teljes nevet: ");
  String name  = stdin.readLineSync()!;
  var list = name.split(" ");
  print("A név nagybetűkkel: "+ list[0][0].toUpperCase() + list[0].substring(1) + " " + list[1][0].toUpperCase() + list[1].substring(1) );
}