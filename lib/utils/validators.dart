class Validators {
  static bool isValidEmail(String email) {
    final RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email.trim());
  }

  static bool isValidPassword(String password) {
    return password.length >= 6;
  }

  static bool isPasswordMatch(String password, String confirmPassword) {
    return password == confirmPassword;
  }

  static String? validateRegisterForm({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
    required bool isAgree,
  }) {
    if (name.trim().isEmpty ||
        email.trim().isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty) {
      return 'Vui lòng điền đầy đủ tất cả các thông tin!';
    }
    if (!isValidEmail(email)) {
      return 'Địa chỉ Email không đúng định dạng!';
    }
    if (!isValidPassword(password)) {
      return 'Mật khẩu phải chứa ít nhất 6 ký tự!';
    }
    if (!isPasswordMatch(password, confirmPassword)) {
      return 'Mật khẩu xác nhận không trùng khớp!';
    }
    if (!isAgree) {
      return 'Vui lòng tích chọn đồng ý với Điều khoản & Chính sách!';
    }
    return null;
  }
}
