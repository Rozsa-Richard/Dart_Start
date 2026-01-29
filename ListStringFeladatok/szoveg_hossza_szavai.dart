import 'dart:io';

void main() {
  print("Addj meg egy mondatot: ");
  String str  = stdin.readLineSync()!;
  print("Karaktereinek száma: ${str.length}");
  var words = str.split(" ");
  print("Szavainak száma: ${words.length}");
}