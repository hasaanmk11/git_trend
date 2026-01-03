import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Widget textOrShimmer(
  bool isLoading, {
  required double width,
  required Widget child,
}) {
  if (!isLoading) return child;

  return shimmerBox(
    Container(
      width: width,
      height: 14,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
      ),
    ),
  );
}

Widget circleOrShimmer(
  bool isLoading, {
  required double size,
  required Widget child,
}) {
  if (!isLoading) return child;

  return shimmerBox(
    Container(
      width: size,
      height: size,
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
    ),
  );
}

Widget avatarOrShimmer(bool isLoading, String? image) {
  if (isLoading) {
    return shimmerBox(
      Container(
        width: 28,
        height: 28,
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
      ),
    );
  }

  return CircleAvatar(
    radius: 14,
    backgroundColor: Colors.grey.shade300,
    backgroundImage: image != null && image.isNotEmpty
        ? CachedNetworkImageProvider(image)
        : null,
    child: image == null || image.isEmpty
        ? const Icon(Icons.person, size: 16, color: Colors.white)
        : null,
  );
}

///  SINGLE SHIMMER WRAPPER FOR ELEMENTS
Widget shimmerBox(Widget child) {
  return Shimmer.fromColors(
    baseColor: Colors.grey.shade300,
    highlightColor: Colors.grey.shade100,
    child: child,
  );
}
