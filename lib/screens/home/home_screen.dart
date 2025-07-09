import 'package:flutter/material.dart';
import 'package:real_estate_app/config/app_theme.dart';
import 'package:real_estate_app/models/post.dart';
import 'package:real_estate_app/screens/home/widgets/filter_button_list.dart';
import 'package:real_estate_app/screens/home/widgets/search_header.dart';
import 'package:real_estate_app/screens/search/search_screen.dart';
import 'package:real_estate_app/services/post_service.dart';
import 'package:real_estate_app/widgets/post_card.dart';
import '../post/post_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Post> posts = [];
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    posts = PostService.getMockPosts();
  }

  @override
  Widget build(BuildContext context) {
    List<Post> filteredPosts = posts.where((post) {
      return post.title.toLowerCase().contains(searchQuery.toLowerCase());
    }).toList();

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 232, 236, 236),
      body: CustomScrollView(
        slivers: [
          // ❄️ Phần search header có nền trong suốt
          SliverPersistentHeader(
            pinned: true,
            delegate: SearchHeaderDelegate(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const SearchScreen()),
                );
              },
            ),
          ),

          // ❄️ Filter trong suốt
          const SliverToBoxAdapter(child: FilterButtonList()),

          // ⬜ Bắt đầu body trắng
          SliverToBoxAdapter(
            child: Container(
              color: Colors.white,
              child: Column(children: [_buildSortRow(filteredPosts.length)]),
            ),
          ),

          // ⬜ List post có nền trắng
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              final post = filteredPosts[index];
              return Container(
                color: Colors.white,
                child: PostCard(
                  post: post,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => PostDetailScreen(post: post),
                      ),
                    );
                  },
                ),
              );
            }, childCount: filteredPosts.length),
          ),
        ],
      ),
    );
  }

  Widget _buildSortRow(int count) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Text('$count bất động sản', style: AppTypography.bodyBold),
          const Spacer(),
          OutlinedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.sort),
            label: const Text('Sắp xếp'),
            style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              side: const BorderSide(color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}
