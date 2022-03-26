import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

import '../../constants/storage_key.dart';
import 'graphql_interface.dart';
import 'http_interface.dart';
import 'storage_interface.dart';

abstract class IApiClient {
  final IHttpClient _api;
  final IGraphQlClient _graphql;
  final IStorage _storage;
  final Future<String?> Function()? _refreshToken;

  IApiClient(this._api, this._graphql, this._storage, this._refreshToken);

  @protected
  Future<dynamic> request(
    ApiMethod method,
    String url, {
    Map<String, String>? headers,
    Map<String, String>? query,
    dynamic body,
    String? contentType,
    Function(double percent)? uploadProgress,
  }) async {
    await checkToken();
    return _api.request(
      method,
      url,
      headers: headers,
      query: query,
      body: body,
      uploadProgress: uploadProgress,
      contentType: contentType,
    );
  }

  @protected
  Future<Map<dynamic, dynamic>> query({
    required String queryString,
    String? operationName,
    Map<String, dynamic> variables = const {},
    CachePolicy? cachePolicy,
  }) async {
    await checkToken();
    return _graphql.query(
        queryString: queryString,
        operationName: operationName,
        variables: variables,
        cachePolicy: cachePolicy);
  }

  @protected
  Future<Map<dynamic, dynamic>> mutate({
    required String queryString,
    String? operationName,
    Map<String, dynamic> variables = const {},
    CachePolicy? cachePolicy,
  }) async {
    await checkToken();
    return _graphql.mutate(
        queryString: queryString,
        operationName: operationName,
        variables: variables,
        cachePolicy: cachePolicy);
  }

  Future checkToken() async {
    final token = await _storage.get<String>(StorageKey.token);
    if (token != null && JwtDecoder.isExpired(token) && _refreshToken != null) {
      final newToken = await _refreshToken!.call();
      if (newToken != null) {
        await _storage.set(StorageKey.token, newToken);
        log('Refreshed token: $newToken');
      } else {
        await _storage.delete(StorageKey.token);
      }
    }
  }
}
