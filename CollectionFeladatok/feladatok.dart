void main(){
  //1. uniqueAsc elements
  //Egy lista elemeiből készíts egy új listát, mely rendezve van nővekedően és minden elem csak egyszer szerepel benne.
  var list = [1,32,2,1,4,6,4,3,32,2,1,3,5,4,3,3];
  var uniqueAsc = list.toSet().toList()..sort();
  print(uniqueAsc);

  //2. vowelsCount
  //Egy megadott szövegből visszaadja, hogy melyik magánhangzóból hány darab van a szövegben.
  //Csak az angol abc betűit kell ellenőrizni!
  var sentence = "I like dogs dogs .";
  Map<String, int> dictonary = {
    'e': 0,
    'u':0,
    'i':0,
    'o':0,
    'a':0,
  };
  for (var i = 0; i < sentence.length; i++) {
    var char = sentence[i].toLowerCase();
    if (dictonary.containsKey(char)){
      dictonary[char] = dictonary[char] !+ 1;
    }
  }
  print(dictonary);

  //3. wordsCount
  //Egy megadott szövegből visszaadja, hogy melyik szóból hány darab van a szövegben.
  //Az angol többes szám és egyes szám esetén két szónak tekintjük a szavakat.

  Map<String, int> dictonary2 = {};
  var words = sentence.split(" ");
  for (var word in words) {
    if (dictonary2.containsKey(word))
      dictonary2[word] = dictonary2[word] !+1;
    else 
      dictonary2[word] = 1;
  }
  print(dictonary2);
}