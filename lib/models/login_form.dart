class LoginForm {
  String username;
  String password;

  LoginForm({
    required this.username,
    required this.password,
  });

  Map<String, String> toMap() {
    return {
      "username": username,
      "password": password,
    };
  }
}
