import 'package:flutter/material.dart';
import 'package:real_estate_app/config/app_theme.dart';
import 'filter_bottom_sheet.dart';

class FilterButtonList extends StatelessWidget {
  const FilterButtonList({super.key});

  final filters = const [
    'Loại nhà đất',
    'Khoảng giá',
    'Diện tích',
    'Số phòng ngủ',
    'Hướng nhà',
    'Hướng ban công',
    'Tin có ảnh',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
      ), // Optional: padding vertical
      child: SizedBox(
        height: 38,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemCount: filters.length,
          separatorBuilder: (_, __) => const SizedBox(width: 8),
          itemBuilder: (_, index) {
            return OutlinedButton.icon(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                  ),
                  builder: (_) => FilterBottomSheet(title: filters[index]),
                );
              },
              icon: const Icon(Icons.keyboard_arrow_down, size: 16),
              label: Text(
                filters[index],
                style: AppTypography.bodyBold.copyWith(
                  color: const Color.fromARGB(255, 127, 127, 127),
                ),
              ),
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                backgroundColor: Colors.white,
                side: const BorderSide(color: Colors.grey),
                padding: const EdgeInsets.symmetric(horizontal: 12),
              ),
            );
          },
        ),
      ),
    );
  }
}
