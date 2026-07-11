import 'package:flutter/material.dart';

class CatogriesCard extends StatelessWidget {
  const CatogriesCard({
    super.key,
    required this.imaageUrl,
    required this.color,
    required this.title,
  });
  final String imaageUrl;
  final Color color;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 50,
          backgroundColor: color,
          child: Image.asset(imaageUrl, width: 60, height: 60),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Color(0XFF7F4E1D),
          ),
        ),
      ],
    );
  }
}
