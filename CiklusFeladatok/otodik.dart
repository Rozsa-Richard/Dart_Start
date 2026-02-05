//5. Kérj be egy számot és írasd ki a szám számjegyeinek négyzetét.
import 'dart:io';

void main() { 
  print("Adj meg egy számot!");
  var szam = stdin.readLineSync()!;

  var szamok = szam.toString().split("");
  szamok.forEach((a){
    int b = int.parse(a);
    print("$a -> ${b*b}");
  });
}