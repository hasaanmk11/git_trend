import 'package:app/home/features/core/theme/colors.dart';
import 'package:flutter/material.dart';

/// A screen that displays detailed information about a GitHub repository.
///
/// This widget shows the repository's:
/// - Name
/// - Description
/// - Star count
/// - Owner username
/// - Owner avatar image
///
/// The screen uses a [Scaffold] with an [AppBar] and a body containing
/// a [Column] layout with the repository details.
class Details extends StatelessWidget {
  /// Name of the repository.
  final String? name;

  /// Description of the repository.
  final String? description;

  /// Number of stars the repository has.
  final String? stars;

  /// Username of the repository owner.
  final String? owner;

  /// URL of the repository owner's avatar image.
  final String? image;

  /// Creates a [Details] screen.
  ///
  /// All fields are optional, and defaults are provided where appropriate.
  const Details({
    super.key,
    this.name,
    this.description,
    this.stars,
    this.owner,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      // App bar with repository name or 'Details' if name is null
      appBar: AppBar(
        title: Text(name ?? 'Details', style: TextStyle(color: Colors.white)),
        backgroundColor: AppColors.bgColor,
      ),

      // Body with padding around content
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Hero animation for avatar image transition
            Hero(
              tag: image ?? '',
              child: CircleAvatar(
                radius: 50,
                // Display network image if available
                backgroundImage: image != null && image!.isNotEmpty
                    ? NetworkImage(image!)
                    : null,
                // Display default icon if no image is provided
                child: image == null || image!.isEmpty
                    ? const Icon(Icons.person, size: 50, color: Colors.white)
                    : null,
              ),
            ),

            const SizedBox(height: 20),

            // Repository name in bold
            Text(
              name ?? '',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 10),

            // Repository description in smaller, gray text
            Text(
              description ?? '',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),

            const SizedBox(height: 20),

            // Row showing star count with icon
            Row(
              children: [
                const Icon(Icons.star, color: Colors.amber),
                const SizedBox(width: 4),
                Text(
                  '$stars stars',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ],
            ),

            const SizedBox(height: 10),

            // Row showing repository owner with icon
            Row(
              children: [
                const Icon(Icons.person, color: Colors.white),
                const SizedBox(width: 4),
                Text(
                  owner ?? '',
                  style: const TextStyle(fontSize: 16, color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
