class OnboardingItem {
  final String image;
  final String title;
  final String subtitle;

  const OnboardingItem({
    required this.image,
    required this.title,
    required this.subtitle,
  });

  // image
  static final List<OnboardingItem> items = [
    const OnboardingItem(
      image: 'assets/images/Rong.png',
      title: "Khám phá Đà Nẵng theo cách riêng của bạn",
      subtitle:
          "Tìm kiếm những điểm đến độc đáo, ẩm thực đặc sắc và trải nghiệm văn hóa địa phương tuyệt vời.",
    ),
    const OnboardingItem(
      image: 'assets/images/Vang.png',
      title: "Lập lịch trình cá nhân hóa",
      subtitle:
          "Tự tạo chuyến đi mơ ước của bạn với các điểm đến được sắp xếp khoa học theo từng ngày.",
    ),
    const OnboardingItem(
      image: 'assets/images/Bien.png',
      title: "Gợi ý thông minh & Tiết kiệm",
      subtitle:
          "Nhận các đề xuất tham quan và ăn uống phù hợp nhất với sở thích và ngân sách riêng của bạn.",
    ),
  ];
}
