import '../models/post.dart';

class PostService {
  static List<Post> getMockPosts() {
    return [
      Post(
        id: '1',
        title: 'Căn hộ cao cấp Vinhomes Central Park',
        price: 3500000000,
        area: 72.0,
        bedrooms: 2,
        bathrooms: 2,
        location: 'Bình Thạnh, TP. HCM',
        imageUrl:
            'https://images.unsplash.com/photo-1600585154340-be6161a56a0c?auto=format&fit=crop&w=800&q=80',
        isVip: true,
        description: 'Căn hộ view sông, nội thất đầy đủ, tiện ích 5 sao.',
      ),
      Post(
        id: '2',
        title: 'Nhà phố Thảo Điền, Quận 2',
        price: 7200000000,
        area: 120.0,
        bedrooms: 3,
        bathrooms: 3,
        location: 'Thảo Điền, TP. HCM',
        imageUrl:
            'https://images.unsplash.com/photo-1600585154340-be6161a56a0c?auto=format&fit=crop&w=800&q=80',
        isVip: false,
        description:
            'Nhà phố 1 trệt 2 lầu, khu dân cư yên tĩnh, gần trường quốc tế.',
      ),
      Post(
        id: '3',
        title: 'Đất nền trung tâm Biên Hòa',
        price: 1800000000,
        area: 90.0,
        bedrooms: 0,
        bathrooms: 0,
        location: 'Biên Hòa, Đồng Nai',
        imageUrl:
            'https://images.unsplash.com/photo-1600585154340-be6161a56a0c?auto=format&fit=crop&w=800&q=80',
        isVip: true,
        description: 'Đất nền chính chủ, SHR, gần chợ và trường học.',
      ),
      Post(
        id: '4',
        title: 'Căn hộ Empire City view Bitexco',
        price: 8900000000,
        area: 94.0,
        bedrooms: 2,
        bathrooms: 2,
        location: 'Thủ Thiêm, TP. HCM',
        imageUrl:
            'https://images.unsplash.com/photo-1600585154340-be6161a56a0c?auto=format&fit=crop&w=800&q=80',
        isVip: true,
        description:
            'Căn hộ cao cấp, view trực diện Bitexco, tiện ích đẳng cấp.',
      ),
      Post(
        id: '5',
        title: 'Nhà cấp 4 Quận 9, gần Vincom',
        price: 2100000000,
        area: 80.0,
        bedrooms: 2,
        bathrooms: 1,
        location: 'Quận 9, TP. HCM',
        imageUrl:
            'https://images.unsplash.com/photo-1600585154340-be6161a56a0c?auto=format&fit=crop&w=800&q=80',
        isVip: false,
        description:
            'Nhà chính chủ, hẻm xe hơi, gần chợ và Vincom Lê Văn Việt.',
      ),
      Post(
        id: '6',
        title: 'Biệt thự nghỉ dưỡng Đà Lạt',
        price: 12500000000,
        area: 350.0,
        bedrooms: 5,
        bathrooms: 4,
        location: 'Phường 5, Đà Lạt',
        imageUrl:
            'https://images.unsplash.com/photo-1600585154340-be6161a56a0c?auto=format&fit=crop&w=800&q=80',
        isVip: true,
        description:
            'Biệt thự sân vườn rộng, full nội thất gỗ, khí hậu mát mẻ quanh năm.',
      ),
      Post(
        id: '7',
        title: 'Đất vườn nghỉ dưỡng Củ Chi',
        price: 2400000000,
        area: 1000.0,
        bedrooms: 0,
        bathrooms: 0,
        location: 'Củ Chi, TP. HCM',
        imageUrl:
            'https://images.unsplash.com/photo-1600585154340-be6161a56a0c?auto=format&fit=crop&w=800&q=80',
        isVip: false,
        description:
            'Đất vườn đường xe hơi, sổ hồng riêng, phù hợp làm farmstay.',
      ),
      Post(
        id: '8',
        title: 'Chung cư Sun Avenue',
        price: 3100000000,
        area: 68.0,
        bedrooms: 2,
        bathrooms: 2,
        location: 'Mai Chí Thọ, Quận 2',
        imageUrl:
            'https://images.unsplash.com/photo-1600585154340-be6161a56a0c?auto=format&fit=crop&w=800&q=80',
        isVip: false,
        description:
            'Căn hộ block A, tầng trung, full nội thất, dọn vào ở ngay.',
      ),
      Post(
        id: '9',
        title: 'Nhà mặt tiền Nguyễn Văn Đậu',
        price: 11300000000,
        area: 96.0,
        bedrooms: 3,
        bathrooms: 3,
        location: 'Bình Thạnh, TP. HCM',
        imageUrl:
            'https://images.unsplash.com/photo-1600585154340-be6161a56a0c?auto=format&fit=crop&w=800&q=80',
        isVip: true,
        description: 'Nhà mặt tiền, kinh doanh tốt, gần Phan Đăng Lưu.',
      ),
      Post(
        id: '10',
        title: 'Căn hộ mini cho thuê Quận Tân Bình',
        price: 1550000000,
        area: 45.0,
        bedrooms: 1,
        bathrooms: 1,
        location: 'Tân Bình, TP. HCM',
        imageUrl:
            'https://images.unsplash.com/photo-1600585154340-be6161a56a0c?auto=format&fit=crop&w=800&q=80',
        isVip: false,
        description: 'Căn hộ mới xây, thích hợp đầu tư cho thuê lâu dài.',
      ),
    ];
  }
}
