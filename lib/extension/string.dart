extension NullableStringExtension on String? {
  bool get isValidUrl {
    final url = this ?? '';
    if (url.isEmpty) return false;

    // Check if the URL has valid scheme and host
    final uri = Uri.tryParse(url);
    return uri != null &&
        (uri.scheme == 'http' || uri.scheme == 'https') &&
        url.startsWith('${uri.scheme}://') &&
        uri.host.isNotEmpty;
  }
}
