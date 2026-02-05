import 'dart:math';

//getRandomNumber - egy vélatlen egész számot ad vissza 1 és 100 között az 1 bgeleértve, a 100 nem)
int getRandomNumber() {
  Random random = new Random();
  return random.nextInt(99) + 1;
}

//getEvenOdd - visszaadja, hogy a megadott egész szám páros vagy páratlan. Visszatérési értéke: odd  vagy even
String getEvenOdd (int number) => number % 2 == 0 ? "even" : "odd";

//getDividers - visszaadja a megadott egész szám osztóit egy listában
List<int> getDividers (int number) {
  List<int> dividers = [];
  for (var i = 1; i < number+1; i++) {
    if (number % i == 0)
      dividers.add(i);
  }
  return dividers;
}

//getVowels - egy string magánhangzóit adja vissza egy listában
List<String> getVowels (String word) {
  List<String> vowels = [];
  List<String> allVowels = ["a","á","e", "é", "i", "í", "o", "ó", "ö", "ő", "u", "ú","ü","ű"];
  for (var i = 0; i < word.length; i++) {
    if (allVowels.contains(word[i].toLowerCase()))
      vowels.add(word[i]);
  }
  
  return vowels;
}

//getConsonants - egy string mássalhangzóit adja vissza listában
List<String> getConsonants (String word) {
  List<String> consonants = [];
  var vowels = getVowels(word);
  for (var i = 0; i < word.length; i++) {
    if (!vowels.contains(word[i].toLowerCase()))
      consonants.add(word[i]);
  }
  return consonants;
}

//getFirst Char- az első karaktert adja vissza, vagy üres karaktert
String getFirst (String word) => word.length !=0 ? word[0] : "" ; 


//sumOfDigits - egy egész szám számjegyeinek az összegét adja vissza
int sumOfDigits (int number) {
 var sum = 0;
 var str = number.toString();
 for (var i = 0; i < str.length; i++) {
   sum+= int.parse(str[i]);
 }
 return sum;
}

void main() {
  print(getRandomNumber());
  print(getEvenOdd(11));
  print(getDividers(7));
  print(getFirst("teszt"));
  print(sumOfDigits(3232));
  print(getVowels("dasAfdf"));
}