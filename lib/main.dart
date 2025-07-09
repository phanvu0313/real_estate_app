import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real_estate_app/config/app_theme.dart';
import 'package:real_estate_app/providers/auth_provider.dart';
import 'package:real_estate_app/providers/save_posts_provider.dart';
import 'package:real_estate_app/screens/home/home_screen.dart';
import 'screens/main_tabs_screen.dart';
import 'providers/tab_controller_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TabControllerProvider()),
        ChangeNotifierProvider(create: (_) => TabManagerControllerProvider()),
        ChangeNotifierProvider(create: (_) => SavedPostProvider()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: const RealEstateApp(),
    ),
  );
}

class RealEstateApp extends StatelessWidget {
  const RealEstateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Real Estate App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme, // dùng theme tách riêng
      home: const MainTabsScreen(), // màn hình mặc định
      routes: {
        // định nghĩa route table sẵn cho tương lai
        '/home': (context) => const HomeScreen(),
        // '/login': (context) => const LoginScreen(),  // thêm sau nếu cần
        // '/post-detail': (context) => const PostDetailScreen(),
      },
    );
  }
}
