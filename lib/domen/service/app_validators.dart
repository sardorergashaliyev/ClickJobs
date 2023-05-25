abstract class AppValidators {
  AppValidators._();
  static bool isValidEmail(String email) => RegExp(
        "^[a-zA-Z0-9.!#\$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*\$",
      ).hasMatch(email);

  static bool isValidPassword(String password) => password.length > 5;
  static bool isValidUsername(String password) => password.length > 5;
  static bool isValidRole(String password) => password.length >= 4;

  static bool isValidConfirmPassword(String password, String confirmPassword) =>
      password == confirmPassword;
}
