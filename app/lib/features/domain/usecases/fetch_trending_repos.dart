import '../repositories/github_repository.dart';
import '../entities/repo.dart';

class FetchTrendingRepos {
  final GithubRepository repository;

  FetchTrendingRepos(this.repository);

  Future<List<Repo>> call(int page) async {
    return await repository.fetchTrendingRepos(page);
  }
}
