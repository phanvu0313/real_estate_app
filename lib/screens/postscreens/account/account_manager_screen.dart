import 'package:flutter/material.dart';
import 'package:real_estate_app/config/app_theme.dart';

class AccountManagerScreen extends StatelessWidget {
  const AccountManagerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () => Navigator.pop(context), // Quay lại màn trước
        ),
        title: const Text("Tài khoản"),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 30,
              child: Text("V", style: AppTypography.heading1),
            ),
            const SizedBox(height: 8),
            Text("Văn Vũ Phan", style: AppTypography.heading2),
            Text("0 điểm", style: AppTypography.body),

            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFFF5F5F5),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text("TK tin đăng"), Text("0")],
                  ),
                  const SizedBox(height: 4),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text("TK khuyến mãi"), Text("0")],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Mã chuyển khoản"),
                      SelectableText(
                        "BDS45715174",
                        style: AppTypography.bodyBold,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),
            const _AccountOption(
              icon: Icons.dashboard,
              title: "Quản lý tin đăng",
            ),
            const _AccountOption(
              icon: Icons.people,
              title: "Quản lý khách hàng",
            ),
            const _AccountOption(
              icon: Icons.card_membership,
              title: "Gói hội viên",
              badge: "Tiết kiệm đến 39%",
            ),
            const _AccountOption(
              icon: Icons.account_balance_wallet,
              title: "Quản lý tài chính",
            ),
            const _AccountOption(
              icon: Icons.description,
              title: "Báo giá và Hướng dẫn",
            ),
            const _AccountOption(icon: Icons.settings, title: "Tiện ích"),

            const SizedBox(height: 32),
            Text("Phiên bản: 3.103.0 (3254)", style: AppTypography.body),

            const SizedBox(height: 32),
            ElevatedButton.icon(
              onPressed: () => Navigator.pop(context), // Trở lại màn gốc
              icon: const Icon(Icons.arrow_back),
              label: const Text("Chuyển sang tìm kiếm"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
                minimumSize: const Size.fromHeight(48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AccountOption extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? badge;

  const _AccountOption({required this.icon, required this.title, this.badge});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon),
      title: Text(title),
      trailing: badge != null
          ? Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.red.shade50,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(badge!, style: AppTypography.heading2),
            )
          : const Icon(Icons.keyboard_arrow_right),
      onTap: () {},
    );
  }
}
