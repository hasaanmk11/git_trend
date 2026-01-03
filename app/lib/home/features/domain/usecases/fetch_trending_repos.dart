import '../repositories/github_repository.dart';
import '../entities/repo.dart';

/// Use case responsible for fetching trending GitHub repositories.
///
/// Acts as a bridge between the UI layer and the repository layer.
class FetchTrendingRepos {
  final GithubRepository repository;

  FetchTrendingRepos(this.repository);

  /// Executes the use case.
  ///
  /// Returns a list of repositories for the given [page].
  Future<List<Repo>> call(int page) async {
    return await repository.fetchTrendingRepos(page);
  }
}
