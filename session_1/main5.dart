void main() {
  List<Map<String, dynamic>> Students = [
    {'name': 'ahmed', 'grade': 95},
    {'name': 'ali', 'grade': 30},
    {'name': 'romisaa', 'grade': 80},
    {'name': 'aser', 'grade': 35},
  ];
  for (var student in Students) {
    if (student['grade'] >= 60) {
      print('${student['name']} is passed');
    } else {
      print('${student['name']} is failed');
    }
  }
}
