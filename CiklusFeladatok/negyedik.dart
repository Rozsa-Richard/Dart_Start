import 'dart:io';
//4. Kérj be egy számot és írasd ki a szám számjegyeinek átlagát két tizedes pontossággal.
void main() {
  print("Adj meg egy számot!");
  int num  = int.parse(stdin.readLineSync()!);
  var sum = 0;
  for (var i = 0; i < num.toString().length; i++) {
    sum += int.parse(num.toString()[i]);
  }
  print("Átlaga: ${(sum/num.toString().length).toStringAsFixed(2)}");
}