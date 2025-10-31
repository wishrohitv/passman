import 'dart:math';

const List<String> characters = [
  "A",
  "B",
  "C",
  "D",
  "E",
  "F",
  "G",
  "H",
  "I",
  "J",
  "K",
  "L",
  "M",
  "N",
  "O",
  "P",
  "Q",
  "R",
  "S",
  "T",
  "U",
  "V",
  "W",
  "X",
  "Y",
  "Z",
  "a",
  "b",
  "c",
  "d",
  "e",
  "f",
  "g",
  "h",
  "i",
  "j",
  "k",
  "l",
  "m",
  "n",
  "o",
  "p",
  "q",
  "r",
  "s",
  "t",
  "u",
  "v",
  "w",
  "x",
  "y",
  "z",
];
const List<String> symbols = [
  "!",
  "@",
  "#",
  "\$",
  "%",
  "^",
  "&",
  "*",
  "(",
  ")",
  "-",
  "_",
  "=",
  "+",
  "[",
  "]",
  "{",
  "}",
  ";",
  ":",
  "'",
  '"',
  ",",
  ".",
  "<",
  ">",
  "/",
  "?",
  "\\",
  "|",
];

const List<String> numbers = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"];
String generateRandomText({
  bool includeNum = true,
  bool includeSymbol = true,
  int length = 32,
}) {
  if (includeNum && includeSymbol) {
    return charactersNumbersAndSymbols(length);
  } else if (includeNum) {
    return charactersAndNumbers(length);
  } else if (includeSymbol) {
    return charactersAndSymbols(length);
  } else {
    return onlyCharacters(length);
  }
}

String onlyCharacters(int length) {
  String text = "";
  for (int i = 0; i < length; i++) {
    int randomInt = Random().nextInt(characters.length);
    text += characters[randomInt];
  }
  return text;
}

String charactersAndNumbers(int length) {
  List<String> cAn = List<String>.from(characters);
  cAn.addAll(numbers.map((numChar) => numChar));
  String text = "";
  for (int i = 0; i < length; i++) {
    int randomInt = Random().nextInt(cAn.length);
    text += cAn[randomInt];
  }
  return text;
}

String charactersAndSymbols(int length) {
  List<String> cAs = List<String>.from(characters);
  cAs.addAll(numbers.map((numChar) => numChar));
  String text = "";
  for (int i = 0; i < length; i++) {
    int randomInt = Random().nextInt(cAs.length);
    text += cAs[randomInt];
  }
  return text;
}

String charactersNumbersAndSymbols(int length) {
  List<String> cAnAs = List<String>.from(characters);
  cAnAs.addAll(numbers.map((numChar) => numChar));
  cAnAs.addAll(symbols.map((symbolChar) => symbolChar));
  String text = "";
  for (int i = 0; i < length; i++) {
    int randomInt = Random().nextInt(cAnAs.length);
    text += cAnAs[randomInt];
  }
  return text;
}
