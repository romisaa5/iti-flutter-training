void main() async {
  printData<String>("Romisaa");
  printData<int>(25);
  printData<double>(3.14);
  printData<bool>(true);

  Operation add = sum;
  Operation sub = subtract;

  print("Sum = ${add(10, 5)}");
  print("Subtract = ${sub(10, 5)}");

  await futureFun();
}

void printData<T>(T data) {
  print("Data: $data");
}

typedef Operation = int Function(int a, int b);

int sum(int a, int b) {
  return a + b;
}

int subtract(int a, int b) {
  return a - b;
}

Future<void> futureFun() async {
  await Future.delayed(Duration(seconds: 2));
  print("Done");
}
