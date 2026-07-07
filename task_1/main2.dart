// Task 2 — Number Analyzer
// •	Create a List of numbers.
// •	Using a loop, print:
// •	- Even numbers only
// •	- Sum of numbers
// •	- Largest number
// •	Use if conditions inside the loop.
void main() {
  List<int> numbers = [10, 5, 8, 3, 20, 15, 12];

  int sum = 0;
  int largest = numbers[0];

  print("Even Numbers:");

  for (int i = 0; i < numbers.length; i++) {
    if (numbers[i] % 2 == 0) {
      print(numbers[i]);
    }
    sum += numbers[i];
    if (numbers[i] > largest) {
      largest = numbers[i];
    }
  }

  print("Sum = $sum");
  print("Largest Number = $largest");
}