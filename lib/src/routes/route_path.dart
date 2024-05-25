class RoutePath {
  final String singlePath;
  final RoutePath? parent;

  String get path => parent != null
      ? '${parent != null ? parent!.path : ''}$singlePath'
      : singlePath;
  String get p => path;
  String get sp => singlePath;

  const RoutePath(this.singlePath, {this.parent});

  @override
  String toString() => path;
}
