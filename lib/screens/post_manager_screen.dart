import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real_estate_app/providers/tab_controller_provider.dart';
import 'package:real_estate_app/screens/postscreens/account/account_manager_screen.dart';
import '../providers/tab_controller_provider.dart';

class PostManagerScreen extends StatefulWidget {
  const PostManagerScreen({super.key});

  @override
  State<PostManagerScreen> createState() => _PostManagerScreenState();
}

class _PostManagerScreenState extends State<PostManagerScreen> {
  int _selectedTab = 1; // Default là "Tin đăng"

  final List<Widget> _screens = [
    Center(child: Text("Tổng quan")),
    Center(child: Text("Tin đăng")),
    Center(child: Text("Đăng tin")),
    Center(child: Text("Khách hàng")),
    const AccountManagerScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final tabIndex = context.watch<TabManagerControllerProvider>().currentTab;
    return Scaffold(
      body: _screens[tabIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: tabIndex,
        onTap: (index) {
          context.read<TabManagerControllerProvider>().setTab(index);
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.pie_chart),
            label: 'Tổng quan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt),
            label: 'Tin đăng',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle, color: Colors.red),
            label: 'Đăng tin',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Khách hàng',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Tài khoản'),
        ],
      ),
    );
  }
}
