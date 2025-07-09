import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:real_estate_app/config/app_theme.dart';
import 'package:real_estate_app/providers/save_posts_provider.dart';
import 'package:real_estate_app/providers/tab_controller_provider.dart';
import 'package:real_estate_app/screens/post/saved_posts_screen.dart';
import 'package:share_plus/share_plus.dart';
import '../../models/post.dart';

class PostDetailScreen extends StatelessWidget {
  final Post post;

  const PostDetailScreen({super.key, required this.post});

  String formatCurrency(int amount) {
    return NumberFormat.currency(locale: 'vi_VN', symbol: '₫').format(amount);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Image with back button
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  ),
                  child: Image.network(
                    post.imageUrl,
                    height: 240,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 12,
                  left: 12,
                  child: CircleAvatar(
                    backgroundColor: Colors.white70,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ),
                Positioned(
                  top: 12,
                  right: 12,
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white70,
                        child: IconButton(
                          icon: const Icon(Icons.share),
                          onPressed: () {
                            Share.share(
                              '${post.title}\nGiá: ${formatCurrency(post.price)}\n${post.location}',
                            );
                          },
                        ),
                      ),
                      const SizedBox(width: 8),
                      CircleAvatar(
                        backgroundColor: Colors.white70,
                        child: IconButton(
                          icon: const Icon(Icons.favorite_border),

                          onPressed: () {
                            // if (!SavedPostService.savedIds.contains(post.id)) {
                            //   SavedPostService.savedIds.add(post.id);
                            //   context.read<SavedPostProvider>().toggle(post.id);
                            // }

                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Đã lưu tin')),
                            );
                            context.read<SavedPostProvider>().toggle(post.id);
                            // ✅ Chuyển sang tab “Tin đã lưu”
                            context.read<TabControllerProvider>().setTab(1);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            // Main Content
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  Text(post.title, style: AppTypography.heading2),
                  const SizedBox(height: 8),
                  Text(
                    '${formatCurrency(post.price)} · ${post.area} m² · ~${(post.price / post.area ~/ 1000000)} tr/m²',
                    style: AppTypography.error,
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      const Icon(Icons.bed_outlined, size: 20),
                      const SizedBox(width: 4),
                      Text('${post.bedrooms} PN'),
                      const SizedBox(width: 16),
                      const Icon(Icons.bathtub_outlined, size: 20),
                      const SizedBox(width: 4),
                      Text('${post.bathrooms} PT'),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      const Icon(Icons.location_on_outlined),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Text(post.location, style: AppTypography.body),
                      ),
                    ],
                  ),
                  const Divider(height: 32),
                  Text('Mô tả', style: AppTypography.bodyBold),
                  const SizedBox(height: 8),
                  Text(post.description, style: AppTypography.body),
                  const SizedBox(height: 32),
                ],
              ),
            ),

            // Action buttons
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 4,
                    color: Colors.black.withOpacity(0.05),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        // TODO: trigger call
                      },
                      icon: const Icon(Icons.phone),
                      label: const Text('Gọi 0912347***'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  IconButton(
                    onPressed: () {
                      // TODO: mở SMS app
                    },
                    icon: const Icon(Icons.message_outlined),
                    tooltip: 'Nhắn tin',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
