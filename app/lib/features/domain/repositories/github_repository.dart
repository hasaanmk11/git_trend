import '../entities/repo.dart';

/// Contract for fetching GitHub repositories.
///
/// This allows the app to switch between remote and local data sources
/// without affecting the rest of the codebase.
abstract class GithubRepository {
  /// Fetches trending GitHub repositories.
  ///
  /// [page] is used for pagination.
  Future<List<Repo>> fetchTrendingRepos(int page);
}
