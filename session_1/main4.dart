void main() {
  List<int> numbers = [1, 2, 3, 4, 5];
  for (int number in numbers) {
    print(number);
  }
  for (int i = 0; i < numbers.length; i++) {
    print(numbers[i]);
  }

  numbers.forEach((number) {
    print(number);
  });
}
