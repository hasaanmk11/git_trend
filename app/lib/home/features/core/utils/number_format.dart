String formatStars(int stars) {
  if (stars >= 1000000000) {
    return "${(stars / 1000000000).toStringAsFixed(1)}B";
  } else if (stars >= 1000000) {
    return "${(stars / 1000000).toStringAsFixed(1)}M";
  } else if (stars >= 1000) {
    return "${(stars / 1000).toStringAsFixed(1)}k";
  } else {
    return stars.toString();
  }
}
