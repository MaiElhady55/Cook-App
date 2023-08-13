int passwordStrength(String? text) {
  int counter = 0;
  int lower = 0;
  int upper = 0;
  int number = 0;
  text!.split("").forEach((element) {
    if (int.tryParse(element) != null) {
      number = 1;
    } else if (element == element.toUpperCase()) {
      upper = 1;
    } else if (element == element.toLowerCase()) {
      lower = 1;
    }
  });
  counter = number + upper + lower;
  return counter;
}
