import 'dart:convert';

import 'package:app/features/core/const/api_key.dart';
import 'package:app/features/core/const/date_formate.dart';
import 'package:app/features/data/models/repo.dart';
import 'package:http/http.dart' as http;

class GithubRemoteDatasource {
  Future<List<RepoModel>> fetchRepos({required int page, int days = 30}) async {
    final formattedDate = DateUtilsHelper.formattedDateFromNow(days);

    final url = GithubApi.trendingRepos(
      page: page,
      createdAfter: formattedDate,
    );

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
