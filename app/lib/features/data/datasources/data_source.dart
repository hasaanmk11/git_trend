import 'dart:convert';
import 'package:app/features/data/models/repo.dart';
import 'package:http/http.dart' as http;

/// Handles communication with the GitHub REST API.
class GithubRemoteDatasource {
  /// Fetches repositories from GitHub API.
  ///
  /// Uses pagination via the [page] parameter.
  Future<List<RepoModel>> fetchRepos(int page) async {
    final url =
        'https://api.github.com/search/repositories'
        '?q=created:>2024-10-17&sort=stars&order=desc&page=$page';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List items = data['items'];

      return items.map((e) => RepoModel.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load repositories from GitHub');
    }
  }
}
