void main() {
  List<String> uefa2024euro = [
    "Spain",
    "Germany",
    "Portugal",
    "France",
    "Netherlands",
    "Turkey",
    "England",
    "Switzerland" ];
  for (var i = 0; i < uefa2024euro.length-1; i++) {
    for (var j = i+1; j < uefa2024euro.length; j++) {
        print("${uefa2024euro[i]} - ${uefa2024euro[j]}");
    }
  }
}