import 'package:app/features/data/datasources/data_source.dart';
import 'package:app/features/data/datasources/local_repo.dart';
import 'package:app/features/data/repositories/git_repo_imp.dart';
import 'package:app/features/domain/usecases/fetch_trending_repos.dart';
import 'package:app/features/presentation/pages/home_page.dart';
import 'package:app/features/presentation/provider/repo_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final remote = GithubRemoteDatasource();
  final local = GithubLocalDatasource();
  final repo = GithubRepositoryImpl(remote, local);
  final usecase = FetchTrendingRepos(repo);

  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => RepoProvider(usecase))],
      child: MaterialApp(home: HomePage()),
    ),
  );
}
