/*Add össze a számokat 0-tól a megadott számig és add vissza az összeget.
Példa:
gausSum(3) ==> 0 + 1 + 2 + 3  = 6*/
int gausSum(int number) {
  var sum = 0;
  for (var i = 0; i <= number; i++) {
    sum+= i;
  }
  return sum;
}

/*Add vissza, hogy milyen értékelést ért el a tanuló a teszten, ha a total az össz pontszám. Az elért pontszám a points.
Az értékelés alapja:
A : 90 %-tól
B: 75 %-tól, 90 %-ig (90 nincs benne)
C: 60 %-tól 75 %.ig (75 nincs benne)
D: 45 %-tól 60 %-ig (60 nincs benne)
F: 0 %-tól 45 %-ig (45 nincs benne)*/
String grade(total, points){
  var percentage = points/ total * 100;
  if (percentage < 45)
    return "F";
  else if (percentage < 60)
    return "D";
  else if (percentage < 75)
    return "C";
  else if (percentage < 90)
    return "B";
  else 
    return "A";
}


/*Adott egy tömb, keresd meg a tömbben lévő duplikátumokat, és adj vissza egy új tömböt
azokból a duplikátumokból. A visszaadott tömb elemeinek abban a sorrendben kell megjelenniük,
amelyben először duplikátumként jelentek meg („1” != 1).

print(' ${duplicates([1, 2, 4, 4, 3, 3, 1, 5, 3, "5"])} ==> [4, 3, 1]')
print('${duplicates([0, 1, 2, 3, 4, 5])} ==> []')*/
List<dynamic> duplicates(List<dynamic> arr) {
  List<dynamic> returnArr = [];
  List<dynamic> used = [];
  for (var e in arr) {
    if (used.contains(e))
      returnArr.add(e);
    used.add(e);
  }
  return returnArr;
}

//A paraméterként kapott szám számjegyeit nagyság szerint csökkenően rendezi és egy egész számként adja vissza.
int sortNumbersDes(int number){
  var numberStr = number.toString();
  var list = [];
  for (var i = 0; i < numberStr.length; i++) {
    list.add(numberStr[i]);
  }
  list.sort();
  var re = "";
  for (var e in list) {
    re += e;
  }
  return int.parse(re);
}

//A paraméterként kapott egész számot megfordítja éa visszadja.
int reverseInteger(int number){
  var numberStr = number.toString();
  var re = "";
  for (var i = numberStr.length-1; i >= 0; i--) {
    re+= numberStr[i];
  }
  return int.parse(re);
}

void main() {
  print(reverseInteger(23));
  print(sortNumbersDes(54363));
  print(' ${duplicates([1, 2, 4, 4, 3, 3, 1, 5, 3, "5"])} ==> [4, 3, 1, 3]');
  print('${duplicates([0, 1, 2, 3, 4, 5])} ==> []');
  print(gausSum(3));
}