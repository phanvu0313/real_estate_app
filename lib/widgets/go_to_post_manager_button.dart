import 'package:flutter/material.dart';
import 'package:real_estate_app/config/app_theme.dart';
import 'package:real_estate_app/screens/auth/login_screen.dart';
import 'package:real_estate_app/screens/post_manager_screen.dart';

class GoToPostButton extends StatelessWidget {
  final bool isLoggedIn;
  const GoToPostButton({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton.icon(
          onPressed: () {
            if (isLoggedIn) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const PostManagerScreen()),
              );
            } else {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const LoginScreen()),
              );
            }
          },
          icon: const Icon(Icons.open_in_new, size: 20),
          label: Text("Chuyển sang đăng tin", style: AppTypography.bodyBold),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            elevation: 4,
          ),
        ),
      ),
    );
  }
}
