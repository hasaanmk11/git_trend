import 'package:app/features/data/datasources/data_source.dart';
import 'package:app/features/data/datasources/local_repo.dart';

import '../../domain/entities/repo.dart';
import '../../domain/repositories/github_repository.dart';


class GithubRepositoryImpl implements GithubRepository {
  final GithubRemoteDatasource remote;
  final GithubLocalDatasource local;

  GithubRepositoryImpl(this.remote, this.local);

  @override
  Future<List<Repo>> fetchTrendingRepos(int page) async {
    try {
      final repos = await remote.fetchRepos(page);

      if (page == 1) {
        await local.cacheRepos(repos);
      }

      return repos;
    } catch (_) {
      
      return await local.getCachedRepos();
    }
  }
}
