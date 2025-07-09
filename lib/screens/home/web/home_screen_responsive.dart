import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:real_estate_app/screens/home/home_screen.dart';
import 'home_screen_web.dart';

class HomeScreenResponsive extends StatelessWidget {
  const HomeScreenResponsive({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (kIsWeb && width >= 800) {
      return const HomeScreenWeb();
    } else {
      return const HomeScreen(); // đã có sẵn (mobile)
    }
  }
}
