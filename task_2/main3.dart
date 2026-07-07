void main() {
  Restaurant restaurant = Restaurant("Food House");

  Pizza pizza = Pizza(name: "Pepperoni Pizza", price: 150, size: "Large");

  Burger burger = Burger(name: "Beef Burger", price: 120, cheese: true);

  restaurant.addFood(pizza);
  restaurant.addFood(burger);

  restaurant.displayMenu();

  print("\n===== Orders =====");
  pizza.printOrder();
  burger.printOrder();

  print("\nTotal Orders: ${Restaurant.orderCount}");
}

mixin Discount {
  double discount = 10;

  double applyDiscount(double price) {
    return price - (price * discount / 100);
  }
}

class Restaurant {
  String name;
  static int orderCount = 0;

  List<Food> menu = [];

  Restaurant(this.name);

  void addFood(Food food) {
    menu.add(food);
    orderCount++;
  }

  void displayMenu() {
    print("===== $name Menu =====");

    for (var item in menuItems()) {
      print(item);
    }
  }

  Iterable<String> menuItems() sync* {
    for (var food in menu) {
      yield "${food.name} - ${food.calculatePrice()} EGP";
    }
  }
}

class Food {
  String name;
  double price;

  Food({required this.name, required this.price});

  double calculatePrice() {
    return price;
  }

  void printOrder() {
    print("$name : ${calculatePrice()} EGP");
  }
}

class Pizza extends Food with Discount {
  String size;

  Pizza({required String name, required double price, this.size = "Medium"})
    : super(name: name, price: price);

  @override
  double calculatePrice() {
    return applyDiscount(price);
  }

  @override
  void printOrder() {
    print("Pizza");
    print("Name : $name");
    print("Size : $size");
    print("Price : ${calculatePrice()} EGP");
  }
}

class Burger extends Food with Discount {
  bool cheese;

  Burger({required String name, required double price, this.cheese = false})
    : super(name: name, price: price);

  @override
  double calculatePrice() {
    if (cheese) {
      return applyDiscount(price + 20);
    }
    return applyDiscount(price);
  }

  @override
  void printOrder() {
    print("Burger");
    print("Name : $name");
    print("Extra Cheese : $cheese");
    print("Price : ${calculatePrice()} EGP");
  }
}
