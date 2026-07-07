// Task 5 — Mini Student System
// •	Create a List of Maps containing 3 students.
// •	Each student should have:
// •	- name
// •	- age
// •	- phone (nullable)
// •	- degree
// •	Using loops and conditions:
// •	- Print successful students only
// •	- Print 'No Phone' if phone is null
// •	- Print the student with the highest degree

void main() {
  List<Map<String, dynamic>> students = [
    {
      "name": "Ahmed",
      "age": 20,
      "phone": "01012345678",
      "degree": 90,
    },
    {
      "name": "Mona",
      "age": 21,
      "phone": null,
      "degree": 75,
    },
    {
      "name": "Ali",
      "age": 19,
      "phone": "01198765432",
      "degree": 45,
    },
  ];

  Map<String, dynamic> topStudent = students[0];

  print("Successful Students:");

  for (int i = 0; i < students.length; i++) {
    if (students[i]["degree"] >= 50) {
      print("Name: ${students[i]["name"]}");
      print("Age: ${students[i]["age"]}");

      if (students[i]["phone"] == null) {
        print("Phone: No Phone");
      } else {
        print("Phone: ${students[i]["phone"]}");
      }

      print("Degree: ${students[i]["degree"]}");
      print("----------------------");
    }
    if (students[i]["degree"] > topStudent["degree"]) {
      topStudent = students[i];
    }
  }

  print("Top Student:");
  print("Name: ${topStudent["name"]}");
  print("Highest Degree: ${topStudent["degree"]}");
}