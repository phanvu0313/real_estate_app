import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real_estate_app/config/app_theme.dart';
import 'package:real_estate_app/providers/auth_provider.dart';
import 'package:real_estate_app/screens/auth/login_screen.dart';
import 'package:real_estate_app/screens/post_manager_screen.dart';
import 'package:real_estate_app/widgets/go_to_post_manager_button.dart';
import 'package:real_estate_app/widgets/user_header.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isLoggedIn = context.watch<AuthProvider>().isLoggedIn;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 24),

          // Header block: login prompt or user info
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              child: isLoggedIn
                  ? const LoggedInView()
                  : const LoginPromptView(),
            ),
          ),
          GoToPostButton(isLoggedIn: context.watch<AuthProvider>().isLoggedIn),

          const SizedBox(height: 24),

          const Divider(height: 1),

          // Other static sections
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                const SizedBox(height: 24),
                Text('Hướng dẫn', style: AppTypography.bodyBold),
                const SizedBox(height: 12),
                _buildTile(
                  Icons.help_outline,
                  'Câu hỏi thường gặp',
                  AppTypography.body,
                ),
                _buildTile(
                  Icons.feedback_outlined,
                  'Góp ý báo lỗi',
                  AppTypography.body,
                ),
                _buildTile(
                  Icons.people_outline,
                  'Về chúng tôi',
                  AppTypography.body,
                ),
                const SizedBox(height: 24),
                Text('Quy định', style: AppTypography.bodyBold),
                const SizedBox(height: 12),
                _buildTile(
                  Icons.description_outlined,
                  'Điều khoản thỏa thuận',
                  AppTypography.body,
                ),
                _buildTile(
                  Icons.security_outlined,
                  'Chính sách bảo mật',
                  AppTypography.body,
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTile(IconData icon, String label, TextStyle style) {
    return ListTile(
      dense: true,
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon),
      title: Text(label, style: style),
      onTap: () {},
    );
  }
}
