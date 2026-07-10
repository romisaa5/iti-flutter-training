import 'package:flutter/material.dart';
import 'package:news_app/core/app_colors.dart';
import 'package:news_app/features/home/data/models/news_response.dart';

class NewsListItem extends StatelessWidget {
  final ArticleModel article;
  final VoidCallback? onTap;

  const NewsListItem({super.key, this.onTap, required this.article});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                article.urlToImage ??
                    'https://www.knoxtntoday.com/wp-content/uploads/2025/02/News-1280x640.jpg',
                width: 150,
                height: 90,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  width: 150,
                  height: 90,
                  color: Colors.grey[300],
                  child: const Icon(Icons.image_not_supported, size: 20),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    article.author ?? 'Unknown Author',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textDark,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    article.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 13.5,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textDark,
                      height: 1.3,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      article.publishedAt.toString(),
                      style: const TextStyle(
                        fontSize: 11,
                        color: AppColors.textGrey,
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
