import 'dart:async';
import 'package:flutter/material.dart';
import 'package:real_estate_app/config/app_theme.dart';

class SearchHeaderDelegate extends SliverPersistentHeaderDelegate {
  final VoidCallback? onTap;

  SearchHeaderDelegate({this.onTap});

  @override
  double get minExtent => 70; // có thể scroll co lại
  @override
  double get maxExtent => 145; // chiều cao tối đa

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final percent = (shrinkOffset / (maxExtent - minExtent)).clamp(0.0, 1.0);
    final topPadding = MediaQuery.of(context).padding.top;

    return Container(
      child: SizedBox.expand(
        child: Stack(
          children: [
            Positioned(
              top:
                  topPadding -
                  (60 *
                      percent), // 👈 bắt đầu ngay dưới status bar, rồi trượt lên
              left: 16,
              right: 16,
              child: Opacity(
                opacity: 1 - percent,
                child: _AnimatedSearchBox(onTap: onTap),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}

class _AnimatedSearchBox extends StatefulWidget {
  final VoidCallback? onTap;

  const _AnimatedSearchBox({this.onTap});

  @override
  State<_AnimatedSearchBox> createState() => _AnimatedSearchBoxState();
}

class _AnimatedSearchBoxState extends State<_AnimatedSearchBox> {
  final List<String> rotatingFilters = [
    'Loại nhà đất',
    'Khoảng giá',
    'Diện tích',
    'Số phòng ngủ',
    'Hướng nhà',
    'Hướng ban công',
    'Tin có ảnh',
  ];

  int currentIndex = 0;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 2), (_) {
      setState(() {
        currentIndex = (currentIndex + 1) % rotatingFilters.length;
      });
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap ?? () {},
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),

        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(),
              child: Icon(Icons.search, color: Colors.black),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min, // ✅ co theo nội dung
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hà Nội',
                    style: AppTypography.heading1.copyWith(fontSize: 20),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Text(
                        'Thêm ',
                        style: TextStyle(fontSize: 15, color: Colors.grey),
                      ),
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 500),
                        switchInCurve: Curves.easeOut,
                        transitionBuilder:
                            (Widget child, Animation<double> animation) {
                              return SlideTransition(
                                position: Tween<Offset>(
                                  begin: const Offset(0, 0.5), // từ dưới lên
                                  end: Offset.zero,
                                ).animate(animation),
                                child: child,
                              );
                            },
                        layoutBuilder:
                            (
                              Widget? currentChild,
                              List<Widget> previousChildren,
                            ) {
                              return Align(
                                alignment: Alignment.centerLeft, // ✅ căn trái
                                child: currentChild,
                              );
                            },
                        child: Text(
                          rotatingFilters[currentIndex],
                          key: ValueKey(currentIndex),
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 4)),
          ],
        ),
      ),
    );
  }
}
