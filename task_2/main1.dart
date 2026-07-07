// Task 1
// Create mixins:
// Fly
// Swim
// Inside mixins:
// * variables
// * methods
// Create classes:
// * Duck
// * Fish
// * Bird
// Requirements:
// * Use with keyword
// * Use extends + with together
// * Create constructors
// * Add functions inside mixins
// Example:
// * fly()
// * swim()
// * printSpeed()
// =================================
void main() {
  Duck duck = Duck("Donald", 40, 15);
  Fish fish = Fish("Nemo", 20);
  Bird bird = Bird("Parrot", 60);

  print("===== Duck =====");
  duck.info();
  duck.fly();
  duck.swim();
  duck.printFlySpeed();
  duck.printSwimSpeed();

  print("\n===== Fish =====");
  fish.info();
  fish.swim();
  fish.printSwimSpeed();

  print("\n===== Bird =====");
  bird.info();
  bird.fly();
  bird.printFlySpeed();
}

class Animal {
  String name;

  Animal(this.name);

  void info() {
    print("Name: $name");
  }
}

mixin Fly {
  int flySpeed = 50;

  void fly() {
    print("Flying...");
  }

  void printFlySpeed() {
    print("Fly Speed: $flySpeed km/h");
  }
}

mixin Swim {
  int swimSpeed = 10;

  void swim() {
    print("Swimming...");
  }

  void printSwimSpeed() {
    print("Swim Speed: $swimSpeed km/h");
  }
}

class Duck extends Animal with Fly, Swim {
  Duck(String name, int flySpeed, int swimSpeed) : super(name) {
    this.flySpeed = flySpeed;
    this.swimSpeed = swimSpeed;
  }
}

class Fish extends Animal with Swim {
  Fish(String name, int swimSpeed) : super(name) {
    this.swimSpeed = swimSpeed;
  }
}

class Bird extends Animal with Fly {
  Bird(String name, int flySpeed) : super(name) {
    this.flySpeed = flySpeed;
  }
}
