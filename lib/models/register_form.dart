class RegisterForm {
  String username;
  String password;
  String name;

  RegisterForm({
    required this.username,
    required this.password,
    required this.name,
  });

  Map<String, String> toMap() {
    return {
      "username": username,
      "password": password,
      "name": name,
    };
  }
}
