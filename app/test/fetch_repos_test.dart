import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/testing.dart';
import 'package:http/http.dart' as http;
import 'package:app/features/data/datasources/data_source.dart';
import 'package:app/features/data/models/repo.dart';

void main() {
  test(
    'fetchRepos returns list of RepoModel when status code is 200',
    () async {
      final mockClient = MockClient((request) async {
        return http.Response(
          jsonEncode({
            'items': [
              {
                'name': 'flutter',
                'description': 'UI toolkit',
                'stargazers_count': 1000,
                'owner': {
                  'login': 'google',
                  'avatar_url': 'https://avatar.com/google.png',
                },
              },
            ],
          }),
          200,
        );
      });

      final datasource = GithubRemoteDatasource(client: mockClient);

      final result = await datasource.fetchRepos(page: 1);

      expect(result, isA<List<RepoModel>>());
      expect(result.length, 1);
      expect(result.first.name, 'flutter');
      expect(result.first.stars, 1000);
      expect(result.first.owner.username, 'google');
    },
  );

  test('fetchRepos throws Exception when status code is not 200', () async {
    final mockClient = MockClient((request) async {
      return http.Response('Error', 500);
    });

    final datasource = GithubRemoteDatasource(client: mockClient);

    expect(
      datasource.fetchRepos(page: 1), // <- no arrow, async handled
      throwsException,
    );
  });
}
