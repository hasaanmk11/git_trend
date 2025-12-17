import 'package:app/features/core/db/app_data_base.dart';
import 'package:app/features/data/models/owner.dart';
import 'package:app/features/data/models/repo.dart';
import 'package:sqflite/sqflite.dart';

class GithubLocalDatasource {
  Future<void> cacheRepos(List<RepoModel> repos) async {
    final db = await AppDatabase.database;

    for (var repo in repos) {
      await db.insert(
        'repos',
        repo.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }

  Future<List<RepoModel>> getCachedRepos() async {
    final db = await AppDatabase.database;
    final rows = await db.query('repos');

    return rows.map((e) {
      return RepoModel(
        name: (e['name'] ?? '').toString(),
        description: (e['description'] ?? '').toString(),
        stars: (e['stars'] as int?) ?? 0,
        owner: OwnerModel(
          username: (e['username'] ?? '').toString(),
          avatarUrl: (e['avatarUrl'] ?? '').toString(),
        ),
      );
    }).toList();
  }
}
