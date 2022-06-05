const imagePath = 'assets/images/';
const iconPath = 'assets/icons/';

class Assets {
  static const icons = _Icon();
  static const images = _Image();
}

class _Icon {
  const _Icon();
  final arrowLeft = '${iconPath}arrowLeft.svg';
  final arrowRight = '${iconPath}arrowRight.svg';
  final faceId = '${iconPath}faceId.svg';
  final history = '${iconPath}history.svg';
  final key = '${iconPath}key.svg';
  final logo = '${iconPath}logo.svg';
  final messageCircle = '${iconPath}messageCircle.svg';
  final qr = '${iconPath}qr.svg';
  final user = '${iconPath}user.svg';
}

class _Image {
  const _Image();
  final defaultAvatar = '${imagePath}defaultAvatar.png';
  final defaultImage = '${imagePath}defaultImage.png';
  final logo = '${imagePath}logo.png';
}
