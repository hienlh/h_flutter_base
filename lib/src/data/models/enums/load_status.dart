enum LoadStatus {
  initial,
  loading,
  loadingMore,
  success,
  failure,
}

extension LoadStatusExt on LoadStatus {
  bool get isLoading => this == LoadStatus.loading;
}
