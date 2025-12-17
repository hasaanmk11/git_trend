import 'package:app/features/data/datasources/data_source.dart';
import 'package:app/features/data/repositories/git_repo_imp.dart';
import 'package:app/features/domain/usecases/fetch_trending_repos.dart';
import 'package:app/features/presentation/app.dart';
import 'package:app/features/presentation/provider/repo_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  final remote = GithubRemoteDatasource();
  final repoImpl = GithubRepositoryImpl(remote);
  final fetchUsecase = FetchTrendingRepos(repoImpl);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => RepoProvider(fetchUsecase)),
      ],
      child: MyApp(),
    ),
  );
}
