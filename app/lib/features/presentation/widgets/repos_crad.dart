import 'package:app/features/presentation/widgets/shimmer_helpers.dart';
import 'package:flutter/material.dart';

class RepoCard extends StatelessWidget {
  final bool isLoading;

  final String? name;
  final String? description;
  final String? stars;
  final String? owner;
  final String? image;

  const RepoCard({
    super.key,
    this.isLoading = false,
    this.name,
    this.description,
    this.stars,
    this.owner,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: isLoading
              ? []
              : [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///  NAME
            textOrShimmer(
              isLoading,
              width: 180,
              child: Text(
                name ?? '',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 6),

            ///  DESCRIPTION
            textOrShimmer(
              isLoading,
              width: double.infinity,
              child: Text(
                description ?? '',
                style: const TextStyle(fontSize: 14, color: Colors.black54),
              ),
            ),
            const SizedBox(height: 6),

            textOrShimmer(
              isLoading,
              width: 240,
              child: const SizedBox(height: 14),
            ),
            const SizedBox(height: 12),

            ///  FOOTER
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ///  STARS
                Row(
                  children: [
                    circleOrShimmer(
                      isLoading,
                      size: 20,
                      child: const Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 4),
                    textOrShimmer(
                      isLoading,
                      width: 60,
                      child: Text('$stars stars'),
                    ),
                  ],
                ),

                /// OWNER
                Row(
                  children: [
                    avatarOrShimmer(isLoading, image),
                    const SizedBox(width: 6),
                    textOrShimmer(
                      isLoading,
                      width: 70,
                      child: Text(
                        owner ?? '',
                        style: const TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
