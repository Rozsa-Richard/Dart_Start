import 'dart:math';

int getRandomNumber() {
  Random random = new Random();
  return random.nextInt(99) + 1;
}
String getEvenOdd (int number) => number % 2 == 0 ? "even" : "odd";

List<int> getDividers (int number) {
  List<int> dividers = [];
  for (var i = 1; i < number+1; i++) {
    if (number % i == 0)
      dividers.add(i);
  }
  return dividers;
}

List<String> getVowels (String word) {
  List<String> vowels = [];
  List<String> allVowels = ["a","á","e", "é", "i", "í", "o", "ó", "ö", "ő", "u", "ú","ü","ű"];
  for (var i = 0; i < word.length; i++) {
    if (allVowels.contains(word[i].toLowerCase()))
      vowels.add(word[i]);
  }
  
  return vowels;
}

List<String> getConsonants (String word) {
  List<String> consonants = [];
  var vowels = getVowels(word);
  for (var i = 0; i < word.length; i++) {
    if (!vowels.contains(word[i].toLowerCase()))
      consonants.add(word[i]);
  }
  return consonants;
}

String getFirst (String word) => word.length !=0 ? word[0] : "" ; 

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