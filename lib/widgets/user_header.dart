// lib/widgets/user_header.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real_estate_app/config/app_theme.dart';
import 'package:real_estate_app/providers/auth_provider.dart';
import 'package:real_estate_app/screens/auth/login_screen.dart';

class LoginPromptView extends StatelessWidget {
  const LoginPromptView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(Icons.tag_faces, color: Color(0xFF007AFF), size: 28),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  'Đăng nhập tài khoản để xem thông tin và liên hệ người bán/cho thuê',
                  style: AppTypography.body,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 12),
                side: const BorderSide(color: Colors.black),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const LoginScreen()),
                );
              },
              child: Text('Đăng nhập', style: AppTypography.bodyBold),
            ),
          ),
        ],
      ),
    );
  }
}

class LoggedInView extends StatelessWidget {
  const LoggedInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 28,
            backgroundImage: AssetImage('assets/avatar_placeholder.png'),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Nguyễn Văn A', style: AppTypography.bodyBold),
                SizedBox(height: 4),
                Text('Thành viên từ 2024', style: AppTypography.body),
              ],
            ),
          ),
          IconButton(
            onPressed: () {
              context.read<AuthProvider>().logout();
            },
            icon: const Icon(Icons.logout, color: Colors.black87),
            tooltip: 'Đăng xuất',
          ),
        ],
      ),
    );
  }
}
