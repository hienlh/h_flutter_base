import 'package:flutter/foundation.dart';

class ListWithTotalResponse<T> {
  ListWithTotalResponse({
    List<T>? items,
    this.totalCount = 0,
  }) : items = items ?? [];

  final List<T> items;
  final int totalCount;

  bool get isLastPage => totalCount <= items.length && totalCount != 0;

  ListWithTotalResponse<T> removeAt(int index) {
    items.removeAt(index);
    return copyWith(totalCount: totalCount - 1);
  }

  ListWithTotalResponse<T> insert(int index, T item) {
    items.insert(index, item);
    return copyWith(totalCount: totalCount + 1);
  }

  ListWithTotalResponse<T> copyWith({
    List<T>? items,
    int? totalCount,
  }) {
    return ListWithTotalResponse<T>(
      items: items ?? this.items,
      totalCount: totalCount ?? this.totalCount,
    );
  }

  factory ListWithTotalResponse.fromJson(Map<String, dynamic>? json,
          T Function(Map<String, dynamic> json) fromJson) =>
      ListWithTotalResponse(
        items: (json?['items'] as List<dynamic>?)
                ?.map<T>((e) => fromJson.call(e))
                .toList() ??
            [],
        totalCount: json?['totalCount'] ?? 0,
      );

  Map<String, dynamic> toJson(Function(T e) toJson) => {
        'items': items.map((e) => toJson.call(e) ?? e).toList(),
        'totalCount': totalCount,
      };

  @override
  String toString() =>
      'ListWithTotalResponse(items: $items, totalCount: $totalCount)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ListWithTotalResponse<T> &&
        listEquals(other.items, items) &&
        other.totalCount == totalCount;
  }

  @override
  int get hashCode => items.hashCode ^ totalCount.hashCode;
}
