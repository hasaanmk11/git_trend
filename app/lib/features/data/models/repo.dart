import 'package:app/features/data/models/owner.dart';

import '../../domain/entities/repo.dart';


class RepoModel extends Repo {
  RepoModel({
    required String name,
    required String description,
    required int stars,
    required OwnerModel owner,
  }) : super(name: name, description: description, stars: stars, owner: owner);

  factory RepoModel.fromJson(Map<String, dynamic> json) {
    return RepoModel(
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      stars: json['stargazers_count'] ?? 0,
      owner: OwnerModel.fromJson(json['owner']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'stars': stars,
      'username': owner.username,
      'avatarUrl': owner.avatarUrl,
    };
  }
}
