void main() {
  // Required Named Parameters
  userInfo(
    name: "Romisaa",
    age: 21,
  );


  // Optional Positional Parameters
  sum(10);
  sum(10, 20);


  // Optional Named Parameters
  studentInfo(
    name: "Ahmed",
  );

  studentInfo(
    name: "Sara",
    phone: "01012345678",
    degree: 95,
  );

  // Default Parameters
  welcome("Ali");
  welcome("Romisaa",'Egypt');
}

void userInfo({
  required String name,
  required int age,
}) {
  print("Name: $name");
  print("Age: $age");
}

void sum(int num1, [int? num2]) {
  int result = num1 + (num2 ?? 0);
  print("Sum = $result");
}
void studentInfo({
  required String name,
  String? phone,
  double? degree,
}) {
  print("Student Name: $name");
  print("Phone: ${phone ?? "No Phone"}");
  print("Degree: ${degree ?? "Not Found"}");
}


void welcome(String name, [String country = "Egypt"]) {
  print("Welcome $name from $country");
}