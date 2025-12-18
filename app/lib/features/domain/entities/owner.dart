/// Represents the owner of a GitHub repository.
///
/// Contains basic user information returned by the GitHub API.
class Owner {
  /// GitHub username of the repository owner.
  final String username;

  /// Avatar image URL of the repository owner.
  final String avatarUrl;

  Owner({required this.username, required this.avatarUrl});
}
