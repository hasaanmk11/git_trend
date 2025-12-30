class GithubApi {
  static const String baseUrl = 'https://api.github.com/search/repositories';

  static String trendingRepos({
    required int page,
    required String createdAfter,
    int perPage = 30,
  }) {
    return '$baseUrl'
        '?q=created:>$createdAfter'
        '&sort=stars'
        '&order=desc'
        '&page=$page'
        '&per_page=$perPage';
  }
}
