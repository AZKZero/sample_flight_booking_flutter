extension MapUtils<K, V> on Map<K, V> {
  Map<K, V> filterNotNull() => this..removeWhere((key, value) => value == null);
  Map<K, V>? nullIfEmpty() => length > 0 ? this : null;
}
