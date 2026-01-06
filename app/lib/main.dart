import 'package:app/home/features/data/datasources/data_source.dart';
import 'package:app/home/features/data/datasources/local_repo.dart';
import 'package:app/home/features/data/repositories/git_repo_imp.dart';
import 'package:app/home/features/domain/usecases/fetch_trending_repos.dart';

import 'package:app/home/features/presentation/provider/repo_provider.dart';
import 'package:app/splash_screen/presentation/pages/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Entry point of the application.
void main() async {
  // Ensures that Flutter bindings are initialized before any asynchronous operations.
  // This is necessary when using async code in main(), like initializing databases or repositories.
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize the remote data source for fetching GitHub repositories via API
  final remote = GithubRemoteDatasource();

  // Initialize the local data source for caching or storing repositories locally
  final local = GithubLocalDatasource();

  // Create the repository implementation combining remote and local data sources.
  // This repository abstracts data access for the use case and presentation layer.
  final repo = GithubRepositoryImpl(remote, local);

  // Create the use case responsible for fetching trending repositories
  final usecase = FetchTrendingRepos(repo);

  // Run the app using Provider for state management
  runApp(
    MultiProvider(
      providers: [
        // Provide RepoProvider to the widget tree
        // RepoProvider uses the use case to fetch and manage repository data
        ChangeNotifierProvider(create: (_) => RepoProvider(usecase)),
      ],

      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    ),
  );
}
