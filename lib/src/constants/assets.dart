const imagePath = 'assets/images/';
const iconPath = 'assets/icons/';

class Assets {
  static const icons = _Icon();
  static const images = _Image();
}

class _Icon {
  const _Icon();
  final apple = '${iconPath}apple.svg';
  final facebook = '${iconPath}facebook.svg';
  final google = '${iconPath}google.svg';
}

class _Image {
  const _Image();
  final defaultAvatar = '${imagePath}defaultAvatar.png';
  final defaultImage = '${imagePath}defaultImage.png';
}
