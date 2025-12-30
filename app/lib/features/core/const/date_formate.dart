class DateUtilsHelper {
  /// Returns date formatted as yyyy-MM-dd
  /// Example: 2025-01-30
  static String formattedDateFromNow(int daysAgo) {
    final date = DateTime.now().subtract(Duration(days: daysAgo));
    return "${date.year}-"
        "${date.month.toString().padLeft(2, '0')}-"
        "${date.day.toString().padLeft(2, '0')}";
  }
}
