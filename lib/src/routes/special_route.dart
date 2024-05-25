import '../data/models/entities/user_entity.dart';

class SpecialRoute {
  final String route;
  final bool requiredSupportedChain;
  final bool requiredConnected;
  final bool Function(dynamic args, UserEntity? user)? except;

  SpecialRoute(
    this.route, {
    bool requiredSupportedChain = false,
    this.requiredConnected = false,
    this.except,
  }) : requiredSupportedChain = requiredConnected || requiredSupportedChain;
}
