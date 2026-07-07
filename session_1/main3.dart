void main() {
  List<Map<String?, dynamic>> users = [
    {null: 'ahmed', 'age': 25, 'color': 'red'},
    {'name': 'ali', 'age': 30, 'color': 'blue'},
    {'name': 'romisaa', 'age': null, 'color': 'green'},
    {'name': 'aser', 'age': 35, 'color': null},
  ];

  print(users[0]['name']);
  ;
}
