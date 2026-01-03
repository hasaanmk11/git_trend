import '../../domain/entities/owner.dart';

/// Data model for a GitHub repository owner.
///
/// Extends the [Owner] domain entity and is responsible for
/// converting JSON data from the API and database into a usable object.
class OwnerModel extends Owner {
  OwnerModel({required String username, required String avatarUrl})
    : super(username: username, avatarUrl: avatarUrl);

  /// Creates an [OwnerModel] from GitHub API JSON response.
  factory OwnerModel.fromJson(Map<String, dynamic> json) {
    return OwnerModel(username: json['login'], avatarUrl: json['avatar_url']);
  }

  /// Converts this object into a map for local database storage.
  Map<String, dynamic> toMap() {
    return {'username': username, 'avatarUrl': avatarUrl};
  }
}
