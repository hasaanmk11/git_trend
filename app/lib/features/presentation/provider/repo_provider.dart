import 'dart:developer';
import 'package:flutter/material.dart';
import '../../domain/entities/repo.dart';
import '../../domain/usecases/fetch_trending_repos.dart';

/// Provider responsible for managing repository state.
///
/// Handles:
/// - Initial loading
/// - Pagination (infinite scroll)
/// - Pull-to-refresh
class RepoProvider extends ChangeNotifier {
  final FetchTrendingRepos fetchTrendingRepos;

  RepoProvider(this.fetchTrendingRepos);

  /// List of repositories displayed in the UI.
  List<Repo> repos = [];

  /// Indicates initial loading state.
  bool isLoading = false;

  /// Indicates pagination loading state.
  bool isMoreLoading = false;

  /// Current page index for pagination.
  int currentPage = 1;

  /// Determines if more data is available from the API.
  bool hasMore = true;

  /// Loads the first page of repositories.
  Future<void> loadRepos() async {
    isLoading = true;
    notifyListeners();

    try {
      currentPage = 1;
      final result = await fetchTrendingRepos(currentPage);
      repos = result;

      for (var repo in result) {
        log(repo.name);
      }

      hasMore = result.length == 30;
    } catch (e) {
      log("Error loading repos: $e");
    }

    isLoading = false;
    notifyListeners();
  }

  /// Refreshes the list by reloading the first page.
  Future<void> refresh() async {
    currentPage = 1;
    repos.clear();
    notifyListeners();
    await loadRepos();
  }

  /// Loads the next page when the user scrolls near the bottom.
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
      log("Error loading more repos: $e");
    }

    isMoreLoading = false;
    notifyListeners();
  }
}
