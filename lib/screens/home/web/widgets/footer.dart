import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF1C1C1E),
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Logo và app links
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'GuruCloneTest',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Row(
                children: const [
                  Icon(Icons.android, color: Colors.white70),
                  SizedBox(width: 8),
                  Text('Android', style: TextStyle(color: Colors.white70)),
                  SizedBox(width: 16),
                  Icon(Icons.phone_iphone, color: Colors.white70),
                  SizedBox(width: 8),
                  Text('iOS', style: TextStyle(color: Colors.white70)),
                ],
              ),
            ],
          ),
          const SizedBox(height: 40),

          // Các cột thông tin
          Wrap(
            alignment: WrapAlignment.spaceBetween,
            runSpacing: 32,
            children: [
              _footerColumn('GuruClone Group', [
                'About Us',
                'Products',
                'Careers',
              ]),
              _footerColumn('Contact Us', ['Newsroom', 'Send Feedback']),
              _footerColumn('Properties For Sale', [
                'Apartments',
                'Condos',
                'Landed Houses',
                'New Launch Projects',
              ]),
              _footerColumn('Properties For Rent', [
                'Rooms',
                'Condos',
                'HDBs',
                'Studios',
              ]),
              _footerColumn('Popular Areas', [
                'District 1',
                'District 2',
                'District 7',
                'District 10',
              ]),
            ],
          ),
          const SizedBox(height: 40),

          const Divider(color: Colors.white24),
          const SizedBox(height: 20),

          const Text(
            '© 2025 GuruCloneTest Pte. Ltd. All rights reserved.',
            style: TextStyle(color: Colors.white54, fontSize: 12),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _footerColumn(String title, List<String> items) {
    return SizedBox(
      width: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 12),
          for (final item in items)
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                item,
                style: const TextStyle(fontSize: 13, color: Colors.white70),
              ),
            ),
        ],
      ),
    );
  }
}
