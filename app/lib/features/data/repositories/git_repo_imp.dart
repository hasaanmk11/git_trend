import 'package:app/features/data/datasources/data_source.dart';

import '../../domain/repositories/github_repository.dart';
import '../../domain/entities/repo.dart';


class GithubRepositoryImpl implements GithubRepository {
  final GithubRemoteDatasource remote;

  GithubRepositoryImpl(this.remote);

  @override
  Future<List<Repo>> fetchTrendingRepos(int page) async {
    return await remote.fetchRepos(page);
  }
}
