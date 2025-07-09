import 'package:flutter/material.dart';
import 'package:real_estate_app/config/app_theme.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String query = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          autofocus: true,
          onChanged: (value) => setState(() => query = value),
          decoration: InputDecoration(
            hintText: 'Tìm kiếm bất động sản...',
            border: InputBorder.none,
            hintStyle: TextStyle(color: Colors.grey.shade500),
          ),
          style: AppTypography.body,
        ),
        backgroundColor: Colors.white,
        elevation: 1,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: query.isEmpty
          ? Center(
              child: Text(
                'Nhập từ khóa để tìm kiếm',
                style: AppTypography.caption,
              ),
            )
          : ListView.builder(
              itemCount: 5, // giả lập kết quả
              itemBuilder: (context, index) => ListTile(
                leading: const Icon(Icons.location_on_outlined),
                title: Text('$query kết quả ${index + 1}'),
                onTap: () {
                  // TODO: xử lý chọn
                  Navigator.pop(context);
                },
              ),
            ),
    );
  }
}
