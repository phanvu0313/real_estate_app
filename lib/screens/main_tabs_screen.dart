import 'package:flutter/foundation.dart'; // ⬅️ cần để dùng kIsWeb
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real_estate_app/providers/auth_provider.dart';
import 'package:real_estate_app/screens/home/web/home_screen_responsive.dart';
import 'package:real_estate_app/screens/profile/account_screen.dart';
import '../providers/tab_controller_provider.dart';
import 'home/home_screen.dart';
import 'post/saved_posts_screen.dart';
import 'auth/login_screen.dart';

class MainTabsScreen extends StatelessWidget {
  const MainTabsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tabIndex = context.watch<TabControllerProvider>().currentTab;
    final width = MediaQuery.of(context).size.width;
    final List<Widget> screens = [
      const HomeScreenResponsive(),
      const SavedPostsScreen(),
      const AccountScreen(),
    ];

    return Scaffold(
      body: IndexedStack(index: tabIndex, children: screens),
      bottomNavigationBar: (kIsWeb && width >= 800)
          ? null // 👈 KHÔNG hiển thị BottomNavBar nếu chạy web
          : BottomNavigationBar(
              selectedItemColor: Colors.black,
              unselectedItemColor: Colors.grey,
              selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
              unselectedLabelStyle: const TextStyle(
                fontWeight: FontWeight.normal,
              ),
              currentIndex: tabIndex,
              onTap: (index) {
                context.read<TabControllerProvider>().setTab(index);
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.search),
                  label: 'Tìm kiếm',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.favorite_border),
                  label: 'Tin đã lưu',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline),
                  label: 'Tài khoản',
                ),
              ],
            ),
    );
  }
}
