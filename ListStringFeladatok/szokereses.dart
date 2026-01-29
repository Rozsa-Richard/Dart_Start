import 'dart:io';

void main() {
  List<String> mostCommonEnglishWords = [
  "the",   "be",   "to",   "of",   "and",   "a",   "in",   "that",   "have",   "I",
  "it",   "for",   "not",   "on",   "with",   "he",   "as",   "you",   "do",   "at",
  "this",   "but",   "his",   "by",   "from",   "they",   "we",   "say",   "her",   "she",
  "or",   "an",   "will",   "my",   "one",   "all",   "would",   "there",   "their",   "is",
  "are",   "was",   "were",   "been",   "has",   "had",   "can",   "could",   "should" ];

  print("Addj meg egy szavat: ");
  String word  = stdin.readLineSync()!;
  if (mostCommonEnglishWords.where((x)=> x == word).length== 0)
    print("A szó nem szerepel a listában");
  else 
    print("A szó szerepel a listában");
}