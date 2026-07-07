// Task 1 — Student Information
// •	Create variables using: var, final, const, and dynamic.
// •	Store: student name, age, GPA, and current time.
// •	Make phone nullable using Null Safety.
// •	If phone is null, print 'No Phone'.
// •	Print all values.

void main() {
  var studentName = "Romisaa";
  final currentTime = DateTime.now();
  const double gpa = 3.85;
  dynamic age = 20;
  String? phone;

  print("Student Name: $studentName");
  print("Age: $age");
  print("GPA: $gpa");
  print("Current Time: $currentTime");
  print("Phone: ${phone?? 'No Phone Number'}");
  
}
