enum CachePolicy {
  /// Return result from cache. Only fetch from network if cached result is not available.
  cacheFirst,

  /// Return result from cache first (if it exists), then return network result once it's available.
  cacheAndNetwork,

  /// Return result from cache if available, fail otherwise.
  cacheOnly,

  /// Return result from network, fail if network call doesn't succeed, don't save to cache.
  noCache,

  /// Return result from network, fail if network call doesn't succeed, save to cache.
  networkOnly,
}

abstract class IGraphQlClient {
  Future<Map> query({
    required String queryString,
    String? operationName,
    Map<String, dynamic> variables = const {},
    CachePolicy? cachePolicy,
  });

  Future<Map> mutate({
    required String queryString,
    String? operationName,
    Map<String, dynamic> variables = const {},
    CachePolicy? cachePolicy,
  });

  Stream<Map> subscribe({
    required String queryString,
    String? operationName,
    Map<String, dynamic> variables = const {},
    CachePolicy? cachePolicy,
  });
}
