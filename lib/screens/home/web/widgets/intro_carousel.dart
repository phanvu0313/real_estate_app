import 'package:flutter/material.dart';

class IntroCarousel extends StatelessWidget {
  final PageController pageController;
  final int currentPage;
  final void Function(int index) onPageChange;

  const IntroCarousel({
    super.key,
    required this.pageController,
    required this.currentPage,
    required this.onPageChange,
  });

  @override
  Widget build(BuildContext context) {
    final List<String> images = [
      'https://images.unsplash.com/photo-1568605114967-8130f3a36994?auto=format&fit=crop&w=1920&q=80', // Nhà hiện đại góc rộng
      'https://images.unsplash.com/photo-1600585154340-be6161a56a0c?auto=format&fit=crop&w=1920&q=80', // Phòng khách sang trọng
      'https://images.unsplash.com/photo-1502673530728-f79b4cab31b1?auto=format&fit=crop&w=1920&q=80', // Chung cư thành phố nhìn từ ngoài
    ];

    return Center(
      child: SizedBox(
        width: 1200,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: SizedBox(
                  height: 360,
                  child: PageView.builder(
                    controller: pageController,
                    itemCount: images.length,
                    onPageChanged: onPageChange,
                    itemBuilder: (context, index) {
                      return Image.network(
                        images[index],
                        width: double.infinity,
                        fit: BoxFit.cover,
                      );
                    },
                  ),
                ),
              ),
              // Dot indicator
              Positioned(
                bottom: 12,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    images.length,
                    (index) => Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: currentPage == index
                            ? Colors.redAccent
                            : Colors.white.withOpacity(0.6),
                      ),
                    ),
                  ),
                ),
              ),
              // Prev Button - Bottom Left Corner
              Positioned(
                left: 16,
                bottom: 16,
                child: IconButton(
                  onPressed: () {
                    final prev =
                        (currentPage - 1 + images.length) % images.length;
                    onPageChange(prev);
                  },
                  icon: const Icon(
                    Icons.chevron_left,
                    size: 36,
                    color: Colors.white,
                  ),
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.black54,
                    shape: const CircleBorder(),
                  ),
                ),
              ),
              // Next Button - Bottom Right Corner
              Positioned(
                right: 16,
                bottom: 16,
                child: IconButton(
                  onPressed: () {
                    final next = (currentPage + 1) % images.length;
                    onPageChange(next);
                  },
                  icon: const Icon(
                    Icons.chevron_right,
                    size: 36,
                    color: Colors.white,
                  ),
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.black54,
                    shape: const CircleBorder(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
