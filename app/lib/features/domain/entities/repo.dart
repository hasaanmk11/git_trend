import 'owner.dart';

class Repo {
  final String name;
  final String description;
  final int stars;
  final Owner owner;

  Repo({
    required this.name,
    required this.description,
    required this.stars,
    required this.owner,
  });
}
