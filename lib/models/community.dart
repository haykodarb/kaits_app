import 'dart:convert';
import 'package:kaits_app/models/user.dart';

class CommunityForm {
  String name;
  String description;

  CommunityForm({
    required this.name,
    required this.description,
  });

  Map<String, String> toMap() {
    return {
      "name": name,
      "description": description,
    };
  }
}

class Community extends CommunityForm {
  String id;
  bool isActive;
  DateTime? createdAt;
  List<User> users = [];

  Community({
    required name,
    required description,
    required this.id,
    required this.isActive,
    required this.createdAt,
  }) : super(name: name, description: description);

  static List<Community>? listFromResponseBody(String body) {
    List<dynamic> _parsedList = jsonDecode(body);

    List<Community> _listOfCommunities = _parsedList
        .map(
          (item) => Community(
            name: item['name'] as String,
            description: item['description'],
            id: item['id'],
            isActive: item['isActive'],
            createdAt: DateTime.tryParse(item['createdAt']),
          ),
        )
        .toList();

    return _listOfCommunities;
  }
}
