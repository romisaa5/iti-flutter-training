// Task 4 — Map & Looping
// •	Create a Map for a student containing:
// •	- name
// •	- age
// •	- phone
// •	- grade
// •	Loop through the Map using forEach and print all keys and values.

void main() {
  Map<String, dynamic> student = {
    "name": "Romisaa",
    "age": 20,
    "phone": "01012345678",
    "grade": 90,
  };

  student.forEach((key, value) {
    print("$key : $value");
  });
}