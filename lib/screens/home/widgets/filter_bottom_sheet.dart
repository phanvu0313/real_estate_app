import 'package:flutter/material.dart';
import 'package:real_estate_app/config/app_theme.dart';

class FilterBottomSheet extends StatelessWidget {
  final String title;
  const FilterBottomSheet({super.key, required this.title});

  List<String> getOptions(String label) {
    switch (label) {
      case 'Loại nhà đất':
        return ['Căn hộ', 'Nhà riêng', 'Biệt thự'];
      case 'Khoảng giá':
        return ['< 1 tỷ', '1 - 2 tỷ', '> 5 tỷ'];
      case 'Diện tích':
        return ['< 30m²', '30 - 100m²', '> 100m²'];
      case 'Số phòng ngủ':
        return ['1', '2', '3+'];
      case 'Hướng nhà':
      case 'Hướng ban công':
        return ['Đông', 'Tây', 'Nam', 'Bắc'];
      default:
        return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    final options = getOptions(title);
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 12),
          Text(title, style: AppTypography.heading2),
          const Divider(),
          ...options.map(
            (opt) => CheckboxListTile(
              title: Text(opt),
              value: false,
              onChanged: (_) {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {},
                    child: const Text('Đặt lại'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Áp dụng'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
