import 'package:app/features/data/models/owner.dart';
import '../../domain/entities/repo.dart';

/// Data model for a GitHub repository.
///
/// Converts API and database data into a domain-level [Repo] entity.
class RepoModel extends Repo {
  RepoModel({
    required String name,
    required String description,
    required int stars,
    required OwnerModel owner,
  }) : super(name: name, description: description, stars: stars, owner: owner);

  /// Creates a [RepoModel] from GitHub API JSON response.
  factory RepoModel.fromJson(Map<String, dynamic> json) {
    return RepoModel(
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      stars: json['stargazers_count'] ?? 0,
      owner: OwnerModel.fromJson(json['owner']),
    );
  }

  /// Converts the repository into a map for SQLite storage.
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'stars': stars,
      'username': owner.username,
      'avatarUrl': owner.avatarUrl,
    };
  }
}
