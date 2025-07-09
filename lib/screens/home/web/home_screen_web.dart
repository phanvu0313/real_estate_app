import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:real_estate_app/models/post.dart';
import 'package:real_estate_app/screens/home/web/widgets/floating_filter_bar.dart';
import 'package:real_estate_app/screens/home/web/widgets/footer.dart';
import 'package:real_estate_app/screens/home/web/widgets/intro_carousel.dart';
import 'package:real_estate_app/screens/home/web/widgets/page_heading.dart';
import 'package:real_estate_app/screens/home/web/widgets/post_card.dart';
import 'package:real_estate_app/screens/home/web/widgets/top_nav.dart';
import 'package:real_estate_app/screens/home/web/widgets/view_toggle.dart';
import 'package:real_estate_app/screens/home/web/widgets/web_header.dart';
import 'package:real_estate_app/screens/post/post_detail_screen.dart';
import 'package:real_estate_app/services/post_service.dart';

class HomeScreenWeb extends StatefulWidget {
  const HomeScreenWeb({super.key});

  @override
  State<HomeScreenWeb> createState() => _HomeScreenWebState();
}

class _HomeScreenWebState extends State<HomeScreenWeb> {
  final List<Post> posts = PostService.getMockPosts();
  String searchQuery = '';
  final ScrollController _scrollController = ScrollController();
  bool showFloatingHeader = false;
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {
        showFloatingHeader = _scrollController.offset > 200;
      });
    });
  }

  void _goToPage(int index) {
    setState(() => _currentPage = index);
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final filteredPosts = posts.where((post) {
      return post.title.toLowerCase().contains(searchQuery.toLowerCase());
    }).toList();

    return Scaffold(
      backgroundColor: const Color(0xFFF4F6F8),
      body: Stack(
        children: [
          // 1. Nội dung chính - scroll được
          CustomScrollView(
            controller: _scrollController,
            slivers: [
              const SliverToBoxAdapter(
                child: SizedBox(height: 80),
              ), // Trừ khoảng top nav
              SliverToBoxAdapter(child: const PageHeading()),
              SliverToBoxAdapter(
                child: IntroCarousel(
                  pageController: _pageController,
                  currentPage: _currentPage,
                  onPageChange: (index) {
                    setState(() => _currentPage = index);
                  },
                ),
              ),
              SliverToBoxAdapter(
                child: FloatingFilterBar(
                  searchQuery: searchQuery,
                  onSearchChanged: (value) =>
                      setState(() => searchQuery = value),
                ),
              ),

              SliverToBoxAdapter(
                child: Center(
                  child: SizedBox(
                    width: 1200,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 24,
                      ),
                      child: Row(
                        children: [
                          const Text(
                            'Ready to Buy Projects',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Spacer(),
                          const ViewToggle(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              SliverToBoxAdapter(
                child: Center(
                  child: SizedBox(
                    width: 1200,
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        const int crossAxisCount = 4;
                        const double spacing = 24;
                        const double desiredCardHeight = 420;

                        final double totalSpacing =
                            spacing * (crossAxisCount - 1);
                        final double itemWidth =
                            (constraints.maxWidth - totalSpacing) /
                            crossAxisCount;

                        final double aspectRatio =
                            itemWidth / desiredCardHeight;

                        return GridView.count(
                          crossAxisCount: crossAxisCount,
                          crossAxisSpacing: spacing,
                          mainAxisSpacing: spacing,
                          childAspectRatio: aspectRatio,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          children: filteredPosts.map((post) {
                            return PostCard(
                              post: post,
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) =>
                                        PostDetailScreen(post: post),
                                  ),
                                );
                              },
                            );
                          }).toList(),
                        );
                      },
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(top: 48),
                  child: const Footer(),
                ),
              ),
            ],
          ),

          // 2. TopNav nổi - trượt lên khi scroll > 200
          AnimatedPositioned(
            duration: const Duration(milliseconds: 200),
            top: showFloatingHeader ? -80 : 0,
            left: 0,
            right: 0,
            child: const TopNav(),
          ),
        ],
      ),
    );
  }

  Widget _navTab(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Text(title, style: const TextStyle(fontSize: 15)),
    );
  }

  Widget _buildIntroBanner() {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Container(
              color: const Color(0xFF0A1D4E),
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Icon(Icons.apartment, color: Colors.amber),
                  SizedBox(height: 12),
                  Text(
                    'Grand Dunman',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    '18 Dunman Road',
                    style: TextStyle(color: Colors.white70),
                  ),
                  SizedBox(height: 8),
                  Text('Price on ask', style: TextStyle(color: Colors.white)),
                  SizedBox(height: 4),
                  Text(
                    '1, 2, 3, 4, 5+',
                    style: TextStyle(color: Colors.white70),
                  ),
                  SizedBox(height: 4),
                  Text(
                    '3 mins (210m) to CC8 Dakota MRT Station',
                    style: TextStyle(color: Colors.white70),
                  ),
                  SizedBox(height: 16),
                  Text('Listed By', style: TextStyle(color: Colors.white70)),
                  Text(
                    'SingHaiyi Group Pte Ltd & CSC Land Group',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                'https://picsum.photos/id/1020/800/500',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _filterChip(String label) {
    return ActionChip(
      onPressed: () {},
      label: Text(label),
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    );
  }

  Widget _chip(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey[100],
        border: Border.all(color: Colors.grey[300]! as Color),
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 11, color: Colors.black87),
      ),
    );
  }
}
