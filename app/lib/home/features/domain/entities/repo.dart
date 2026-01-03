import 'owner.dart';

/// Represents a GitHub repository.
///
/// This entity is used across the domain and presentation layers.
class Repo {
  /// Repository name.
  final String name;

  /// Short description of the repository.
  final String description;

  /// Number of stars the repository has.
  final int stars;

  /// Owner details of the repository.
  final Owner owner;

  Repo({
    required this.name,
    required this.description,
    required this.stars,
    required this.owner,
  });
}
