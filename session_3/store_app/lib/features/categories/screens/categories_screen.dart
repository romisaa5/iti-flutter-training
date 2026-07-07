import 'package:flutter/material.dart';
import 'package:store_app/features/home/widgets/catogries_card.dart';

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({super.key});

  List<Map<String, dynamic>> categories = [
    {
      'image': 'assets/images/1.png',
      'color': const Color(0XFFEDD0FF),
      'title': 'Fruits',
    },
    {
      'image': 'assets/images/2.png',
      'color': const Color(0XFFFFD9BA),
      'title': 'Vegtables',
    },
    {
      'image': 'assets/images/3.png',
      'color': const Color(0XFFFEECE6),
      'title': 'Meat',
    },
    {
      'image': 'assets/images/4.png',
      'color': const Color(0XFFE9F5FF),
      'title': 'Fish',
    },
    {
      'image': 'assets/images/5.png',
      'color': const Color(0XFFFEECE6),
      'title': 'Sea food',
    },
    {
      'image': 'assets/images/6.png',
      'color': const Color(0XFFE3F4DE),
      'title': 'Juice',
    },
    {
      'image': 'assets/images/1.png',
      'color': const Color(0XFFDCEEFB),
      'title': 'Egg & Milk',
    },
    {
      'image': 'assets/images/2.png',
      'color': const Color(0XFFFCE1EE),
      'title': 'Ice cream',
    },
    {
      'image': 'assets/images/3.png',
      'color': const Color(0XFFFDE3C7),
      'title': 'Cake',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 20),
          const Text(
            'Categories',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Color(0XFFFF7A1A),
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            decoration: InputDecoration(
              hintText: 'Search',
              prefixIcon: const Icon(Icons.search, color: Color(0xFF9E9E9E)),
              filled: true,
              fillColor: const Color(0xFFF3F3F3),
              contentPadding: const EdgeInsets.symmetric(vertical: 0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
          ),

          Expanded(
            child: GridView.builder(
              itemCount: categories.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 20,
                crossAxisSpacing: 12,
                childAspectRatio: 0.8,
              ),
              itemBuilder: (context, index) {
                return CatogriesCard(
                  imaageUrl: categories[index]['image'],
                  color: categories[index]['color'],
                  title: categories[index]['title'],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
