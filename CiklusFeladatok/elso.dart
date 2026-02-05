import 'dart:io';
//1. Kérj be két (legfeljebb kétjegyű) egész számot!
//A kisebbtől a nagyobbik írasd ki a számokat és írd mellé, hogy páros, vagy páratlan a szám.
void main() {
  print("Adj meg egy számot!");
  int num1  = int.parse(stdin.readLineSync()!);
  print("Adj meg egy másik számot!");
  int num2  = int.parse(stdin.readLineSync()!);
  if (num1 > num2){
     var csere = num1;
     num1 = num2;
     num2 = csere;
  }
  for (var i = num1; i < num2; i++) {
    if (i.isEven)
      print("${i} Páros");
    else 
      print("${i} Páratlan");
  }
}