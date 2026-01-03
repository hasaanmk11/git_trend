import 'dart:convert';

import 'package:app/features/core/const/api_key.dart';
import 'package:app/features/core/const/date_formate.dart';
import 'package:app/features/data/models/repo.dart';
import 'package:http/http.dart' as http;

/// A data source class responsible for fetching repositories from GitHub's API.
///
/// This class abstracts the details of network communication and provides
/// a method to fetch trending repositories. It can use a custom HTTP client
/// (useful for testing) or default to a standard `http.Client`.
class GithubRemoteDatasource {
  /// The HTTP client used to make network requests.
  /// Can be a real client or a mock client for testing.
  final http.Client client;

  /// Constructs a [GithubRemoteDatasource] with an optional HTTP client.
  ///
  /// If no client is provided, a new `http.Client` is created.
  GithubRemoteDatasource({http.Client? client})
    : client = client ?? http.Client();

  /// Fetches a list of trending repositories from GitHub.
  ///
  /// [page]: The page number for pagination.
  /// [days]: The number of days back to consider for trending repositories (default is 30).
  ///
  /// Returns a [Future] containing a list of [RepoModel].
  /// Throws an [Exception] if the HTTP response status is not 200.
  Future<List<RepoModel>> fetchRepos({required int page, int days = 30}) async {
    // Calculate the date `days` ago and format it for GitHub API
    final formattedDate = DateUtilsHelper.formattedDateFromNow(days);

    // Build the GitHub API URL with query parameters
    final url = GithubApi.trendingRepos(
      page: page,
      createdAfter: formattedDate,
    );

    // Send GET request to GitHub
    final response = await client.get(Uri.parse(url));

    // Check if the response was successful
    if (response.statusCode == 200) {
      // Decode JSON response into a Dart Map
      final data = json.decode(response.body);

      // Extract the list of repositories from the JSON
      final List items = data['items'];

      // Convert each JSON item into a RepoModel object
      return items.map((e) => RepoModel.fromJson(e)).toList();
    } else {
      // Throw an exception if the API call fails
      throw Exception('Failed to load repositories');
    }
  }
}
