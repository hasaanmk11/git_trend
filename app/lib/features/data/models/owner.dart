import '../../domain/entities/owner.dart';

class OwnerModel extends Owner {
  OwnerModel({required String username, required String avatarUrl})
    : super(username: username, avatarUrl: avatarUrl);

  factory OwnerModel.fromJson(Map<String, dynamic> json) {
    return OwnerModel(username: json['login'], avatarUrl: json['avatar_url']);
  }

  Map<String, dynamic> toMap() {
    return {'username': username, 'avatarUrl': avatarUrl};
  }
}
