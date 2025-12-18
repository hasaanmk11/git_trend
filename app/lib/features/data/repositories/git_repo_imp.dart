import 'package:app/features/data/datasources/data_source.dart';
import 'package:app/features/data/datasources/local_repo.dart';
import '../../domain/entities/repo.dart';
import '../../domain/repositories/github_repository.dart';

/// Repository implementation that combines remote API and local cache.
class GithubRepositoryImpl implements GithubRepository {
  final GithubRemoteDatasource remote;
  final GithubLocalDatasource local;

  GithubRepositoryImpl(this.remote, this.local);

  /// Fetches repositories from API.
  ///
  /// - Saves page 1 results to local database
  /// - Falls back to cached data if network fails
  @override
  Future<List<Repo>> fetchTrendingRepos(int page) async {
    try {
      final repos = await remote.fetchRepos(page);

      // Cache only first page for offline usage
      if (page == 1) {
        await local.cacheRepos(repos);
      }

      return repos;
    } catch (_) {
      // If API fails, return cached data
      return await local.getCachedRepos();
    }
  }
}
