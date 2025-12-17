import '../entities/repo.dart';

abstract class GithubRepository {
  Future<List<Repo>> fetchTrendingRepos(int page);
}
