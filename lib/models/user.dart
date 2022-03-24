import 'dart:convert';

class User {
  String username;
  String id;

  User({
    required this.username,
    required this.id,
  });

  Map<String, String> toMap() {
    return {
      "username": username,
      "id": id,
    };
  }

  static List<User>? listFromResponseBody(String body) {
    List<dynamic> _parsedList = jsonDecode(body);

    List<User> _listOfUsers = _parsedList
        .map(
          (item) => User(
            username: item['username'] as String,
            id: item['id'] as String,
          ),
        )
        .toList();

    return _listOfUsers;
  }
}
