void main() {
  int x = 7;
  int y = 3;

  print('Sum = ${x + y}');
  print('Subtraction = ${x - y}');
  print('Multiplication = ${x * y}');
  print('Division = ${x / y}');
  print('Integer Division = ${x ~/ y}');
  print('Remainder = ${x % y}');

  int z = 6;
  z += 5;
  print('z +5 = $z');
  z -= 5;
  print('z -5 = $z');

  z++;
  print('z++ = $z');
  z--;
  print('z-- = $z');
}
