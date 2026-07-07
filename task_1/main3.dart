// Task 3 — Student Grades System
// •	Create a List of student degrees.
// •	Using loops and conditions:
// •	- If degree >= 85 print Excellent
// •	- If degree >= 70 print Very Good
// •	- If degree >= 50 print Pass
// •	- Otherwise print Fail
void main() {
  List<int> degrees = [95, 82, 74, 68, 50, 45, 30];

  for (int i = 0; i < degrees.length; i++) {
    print("Degree: ${degrees[i]}");

    if (degrees[i] >= 85) {
      print("Excellent");
    } else if (degrees[i] >= 70) {
      print("Very Good");
    } else if (degrees[i] >= 50) {
      print("Pass");
    } else {
      print("Fail");
    }
  }
}