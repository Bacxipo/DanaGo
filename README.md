# 🌴 DanaGo - Hệ thống hỗ trợ du lịch thông minh Đà Nẵng

Ứng dụng hỗ trợ du lịch thông minh được xây dựng bằng **Flutter**, giúp du khách dễ dàng khám phá điểm đến, lên lịch trình cá nhân hóa và lựa chọn sở thích du lịch tại Đà Nẵng.

---

## ✨ Tính năng nổi bật (Features)

- 🚀 **Onboarding Slider**: Màn hình giới thiệu điểm đến với hiệu ứng trượt ảnh & chỉ báo chấm xanh truyền động.
- 🔐 **Authentication (Xác thực)**:
  - Màn hình **Đăng nhập** (Hỗ trợ ẩn/hiện mật khẩu & Nút Đăng nhập Google).
  - Màn hình **Đăng ký** (Tự động kiểm tra định dạng email, mật khẩu trùng khớp & điều khoản).
  - Màn hình **Quên mật khẩu** (Gửi mã xác minh khôi phục).
- 🎯 **Khai báo Sở thích (Interests Selection)**: Gợi ý điểm đến cá nhân hóa theo từng sở thích (Biển, Ẩm thực, Di tích, Cafe...).
- 🎨 **Kiến trúc Clean Code**: Tách biệt `models/`, `widgets/`, `theme/`, `utils/` và `screen/` dễ bảo trì & mở rộng.

---

## 🛠️ Công nghệ sử dụng (Tech Stack)

- **Framework**: [Flutter](https://flutter.dev) (Dart SDK)
- **Design System**: Material Design 3, HSL Custom Colors, Glassmorphism
- **Architecture**: Component-Based Architecture & Reusable Widgets

---

## 📁 Cấu trúc thư mục dự án

```text
lib/
├── main.dart                   # Điểm khởi chạy ứng dụng
├── models/                     # Data Models (OnboardingItem...)
├── screen/                     # Màn hình (Khampha, Login, Register, Interest...)
├── theme/                      # AppColors, AppStyles
├── utils/                      # Validators, UiHelpers
└── widgets/                    # CustomTextField, InterestCard, OnboardingCard...

assets/
├── icons/                      # Các biểu tượng icon SVG/PNG
└── images/                     # Hình ảnh du lịch Cầu Rồng, Bà Nà Hills...
