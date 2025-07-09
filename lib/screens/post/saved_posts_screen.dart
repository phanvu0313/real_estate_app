import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real_estate_app/config/app_theme.dart';
import 'package:real_estate_app/providers/auth_provider.dart';
import 'package:real_estate_app/providers/save_posts_provider.dart';
import 'package:real_estate_app/widgets/user_header.dart';
import '../../services/post_service.dart';
import '../../widgets/post_card.dart';
import 'post_detail_screen.dart';

class SavedPostService {
  static List<String> savedIds = []; // danh sách postId đã lưu
}

class SavedPostsScreen extends StatelessWidget {
  const SavedPostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final allPosts = PostService.getMockPosts();
    final savedIds = context.watch<SavedPostProvider>().savedIds;
    final isLoggedIn = context.watch<AuthProvider>().isLoggedIn;
    final savedPosts = allPosts
        .where((post) => savedIds.contains(post.id))
        .toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Tin đã lưu')),
      body: isLoggedIn
          ? savedPosts.isEmpty
                ? Center(
                    child: Text(
                      'Chưa có tin nào được lưu',
                      style: AppTypography.heading2,
                    ),
                  )
                : ListView.builder(
                    itemCount: savedPosts.length,
                    itemBuilder: (context, index) {
                      final post = savedPosts[index];
                      return PostCard(
                        post: post,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => PostDetailScreen(post: post),
                            ),
                          );
                        },
                      );
                    },
                  )
          : const LoginPromptView(),
    );
  }
}
