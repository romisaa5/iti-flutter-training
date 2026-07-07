void main() {
  const card1 = Card(
    title: 'Romisaa Fadel',
    color: 'Blue',
  );

  print('Title: ${card1.title}');
  print('Color: ${card1.color}');
}

class Card {
  final String title;
  final String color;

  const Card({
    required this.title,
    required this.color,
  });
}