import 'package:app/home/features/core/theme/colors.dart';
import 'package:app/home/features/presentation/widgets/shimmer_helpers.dart';
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
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Container(
        padding: const EdgeInsets.all(1.5), // 👈 gradient border thickness
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
        child: Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white.withValues(alpha: 0.2)),
            color: AppColors.bgColor,
            borderRadius: BorderRadius.circular(10.5),

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
                  name ?? 'NO NAME',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 6),

              ///  DESCRIPTION
              textOrShimmer(
                isLoading,
                width: double.infinity,
                child: Text(
                  description ?? 'NO DESCRIPTION ',
                  style: const TextStyle(fontSize: 14, color: Colors.white70),
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
                        child: Text(
                          '$stars stars',
                          style: TextStyle(color: Colors.white),
                        ),
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
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
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
}
