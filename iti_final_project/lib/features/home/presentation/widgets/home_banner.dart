import 'package:flutter/material.dart';
import 'package:iti_final_project/core/theme/app_colors/light_app_colors.dart';
import 'package:iti_final_project/core/theme/app_texts/app_text_styles.dart';

class HomeBannerData {
  final String title;
  final String subtitle;
  final String imageUrl;

  const HomeBannerData({
    required this.title,
    required this.subtitle,
    required this.imageUrl,
  });
}

class HomeBannerCarousel extends StatefulWidget {
  const HomeBannerCarousel({super.key});

  static const List<HomeBannerData> _banners = [
    HomeBannerData(
      title: 'Get Winter Discount',
      subtitle: '20% Off For Children',
      imageUrl: 'assets/images/app_image.png',
    ),
    HomeBannerData(
      title: 'New Season Arrivals',
      subtitle: 'Up to 30% Off Jackets',
      imageUrl: 'assets/images/app_image.png',
    ),
    HomeBannerData(
      title: 'Sneaker Days',
      subtitle: 'Buy 1 Get 1 Free',
      imageUrl: 'assets/images/app_image.png',
    ),
  ];

  @override
  State<HomeBannerCarousel> createState() => _HomeBannerCarouselState();
}

class _HomeBannerCarouselState extends State<HomeBannerCarousel> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final banners = HomeBannerCarousel._banners;

    return Column(
      children: [
        SizedBox(
          height: 140,
          child: PageView.builder(
            controller: _controller,
            itemCount: banners.length,
            onPageChanged: (index) => setState(() => _currentPage = index),
            itemBuilder: (context, index) => BannerCard(data: banners[index]),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(banners.length, (index) {
            final isActive = index == _currentPage;
            return AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              margin: const EdgeInsets.symmetric(horizontal: 3),
              width: isActive ? 18 : 6,
              height: 6,
              decoration: BoxDecoration(
                color: isActive
                    ? LightAppColors.primary600
                    : LightAppColors.grey300,
                borderRadius: BorderRadius.circular(3),
              ),
            );
          }),
        ),
      ],
    );
  }
}

class BannerCard extends StatelessWidget {
  final HomeBannerData data;

  const BannerCard({required this.data});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            color: LightAppColors.primary600,
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        data.title,
                        style: AppTextStyles.font18Bold.copyWith(
                          color: LightAppColors.white,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        data.subtitle,
                        style: AppTextStyles.font14SemiBold.copyWith(
                          color: LightAppColors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Image.asset(
                  data.imageUrl,
                  width: 90,
                  height: 100,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      const SizedBox(width: 90, height: 100),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
