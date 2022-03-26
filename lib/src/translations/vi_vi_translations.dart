part of 'app_translations.dart';

extension _Vi on Strings {
  String get vi {
    switch (this) {
      case Strings.hello:
        return 'Xin chào';
      case Strings.vietnamese:
        return 'Tiếng Việt';
      case Strings.english:
        return 'Tiếng Anh';
      case Strings.changeTheme:
        return 'Đổi giao diện';
      case Strings.noNetworkConnection:
        return 'Không có kết nối mạng';
      case Strings.unknownError:
        return 'Đã xảy ra lỗi, vui lòng thử lại';
    }
  }
}
