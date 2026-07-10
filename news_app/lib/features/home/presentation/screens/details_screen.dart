import 'package:flutter/material.dart';
import 'package:news_app/features/home/data/models/news_response.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.model});
  final ArticleModel model;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back_ios_new_rounded, color: Colors.blue),
        ),
        title: Text(
          ''
          'News Detail',
          style: TextStyle(
            fontSize: 20,
            color: Colors.blue,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ///======image===============
              ClipRRect(
                borderRadius: BorderRadiusGeometry.all(Radius.circular(18)),
                child: Image.network(
                  model.urlToImage ??
                      'https://cdn.pixabay.com/photo/2017/06/26/19/03/news-2444778_1280.jpg',
                ),
              ),
              SizedBox(height: 12),

              ///======name===============
              Text(
                model.author ?? 'Rana',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 12),

              ///======description===============
              Text(
                model.description ?? '',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
