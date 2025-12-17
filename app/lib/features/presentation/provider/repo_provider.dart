import 'dart:developer';

import 'package:flutter/material.dart';
import '../../domain/entities/repo.dart';
import '../../domain/usecases/fetch_trending_repos.dart';

class RepoProvider extends ChangeNotifier {
  final FetchTrendingRepos fetchTrendingRepos;

  RepoProvider(this.fetchTrendingRepos);

  List<Repo> repos = [];
  bool isLoading = false;
  bool isMoreLoading = false;
  int currentPage = 1;
  bool hasMore = true;

  Future<void> loadRepos() async {
    isLoading = true;
    notifyListeners();

    try {
      currentPage = 1;
      final result = await fetchTrendingRepos(currentPage);
      repos = result;
      for (var element in result) {
        log(element.name);
        log(element.description);
      }
      hasMore = result.length == 30;
    } catch (e) {
      print("Error loading repos: $e");
    }

    isLoading = false;
    notifyListeners();
  }

  Future<void> refresh() async {
    currentPage = 1;
    repos.clear();
    notifyListeners();
    await loadRepos();
  }

  Future<void> loadMore() async {
    if (isMoreLoading || !hasMore) return;

    isMoreLoading = true;
    notifyListeners();

    try {
      currentPage++;
      final result = await fetchTrendingRepos(currentPage);
      repos.addAll(result);
      hasMore = result.length == 30;
    } catch (e) {
      print("Error loading more repos: $e");
    }

    isMoreLoading = false;
    notifyListeners();
  }
}
