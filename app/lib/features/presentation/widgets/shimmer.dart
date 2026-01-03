import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Widget shimmerCard() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    child: Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///  Repo name
            _shimmerLine(width: 180, height: 16),
            const SizedBox(height: 6),

            ///  Description line 1
            _shimmerLine(width: double.infinity, height: 14),
            const SizedBox(height: 6),

            ///  Description line 2
            _shimmerLine(width: 240, height: 14),
            const SizedBox(height: 12),

            ///  Bottom row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ///  Stars
                Row(
                  children: [
                    _shimmerCircle(size: 20),
                    const SizedBox(width: 6),
                    _shimmerLine(width: 60, height: 14),
                  ],
                ),

                ///  Owner
                Row(
                  children: [
                    _shimmerCircle(size: 28),
                    const SizedBox(width: 6),
                    _shimmerLine(width: 70, height: 14),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

///  Helpers

Widget _shimmerLine({required double width, required double height}) {
  return Container(
    width: width,
    height: height,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(6),
    ),
  );
}

Widget _shimmerCircle({required double size}) {
  return Container(
    width: size,
    height: size,
    decoration: const BoxDecoration(
      color: Colors.white,
      shape: BoxShape.circle,
    ),
  );
}
