import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:real_estate_app/config/app_theme.dart';

class CreatePostScreen extends StatefulWidget {
  const CreatePostScreen({super.key});

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  final _formKey = GlobalKey<FormState>();

  final _titleController = TextEditingController();
  final _priceController = TextEditingController();
  final _areaController = TextEditingController();
  final _locationController = TextEditingController();
  final _descriptionController = TextEditingController();

  String propertyType = 'Căn hộ';
  int bedrooms = 1;
  int bathrooms = 1;
  File? selectedImage;

  final picker = ImagePicker();

  Future<void> _pickImage() async {
    final picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() {
        selectedImage = File(picked.path);
      });
    }
  }

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      // Mock submit
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Bài đăng đã được gửi')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Đăng bài bất động sản')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _sectionTitle('Thông tin cơ bản'),
            TextFormField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Tiêu đề bài viết'),
              validator: (value) =>
                  value == null || value.isEmpty ? 'Nhập tiêu đề' : null,
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<String>(
              value: propertyType,
              decoration: const InputDecoration(labelText: 'Loại bất động sản'),
              items: ['Căn hộ', 'Nhà phố', 'Đất nền', 'Văn phòng']
                  .map(
                    (type) => DropdownMenuItem(value: type, child: Text(type)),
                  )
                  .toList(),
              onChanged: (value) {
                setState(() => propertyType = value!);
              },
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _priceController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Giá bán (VNĐ)'),
              validator: (value) =>
                  value == null || value.isEmpty ? 'Nhập giá' : null,
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _areaController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Diện tích (m²)'),
              validator: (value) =>
                  value == null || value.isEmpty ? 'Nhập diện tích' : null,
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _locationController,
              decoration: const InputDecoration(labelText: 'Vị trí'),
              validator: (value) =>
                  value == null || value.isEmpty ? 'Nhập vị trí' : null,
            ),

            const SizedBox(height: 24),
            _sectionTitle('Thông tin chi tiết'),
            Row(
              children: [
                const Text('Phòng ngủ:'),
                const SizedBox(width: 12),
                DropdownButton<int>(
                  value: bedrooms,
                  items: List.generate(
                    10,
                    (i) =>
                        DropdownMenuItem(value: i + 1, child: Text('${i + 1}')),
                  ),
                  onChanged: (value) => setState(() => bedrooms = value!),
                ),
                const SizedBox(width: 24),
                const Text('Phòng tắm:'),
                const SizedBox(width: 12),
                DropdownButton<int>(
                  value: bathrooms,
                  items: List.generate(
                    10,
                    (i) =>
                        DropdownMenuItem(value: i + 1, child: Text('${i + 1}')),
                  ),
                  onChanged: (value) => setState(() => bathrooms = value!),
                ),
              ],
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _descriptionController,
              maxLines: 5,
              decoration: const InputDecoration(
                labelText: 'Mô tả chi tiết',
                alignLabelWithHint: true,
              ),
            ),

            const SizedBox(height: 24),
            _sectionTitle('Hình ảnh'),
            const SizedBox(height: 8),
            GestureDetector(
              onTap: _pickImage,
              child: Container(
                height: 160,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(12),
                ),
                alignment: Alignment.center,
                child: selectedImage != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.file(
                          selectedImage!,
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      )
                    : const Text('Chọn ảnh từ thư viện'),
              ),
            ),

            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: _submitForm,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                backgroundColor: Colors.indigo,
                foregroundColor: Colors.white,
              ),
              child: Text('Đăng bài', style: AppTypography.body),
            ),
          ],
        ),
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(title, style: AppTypography.bodyBold),
    );
  }
}
