class RegexConstants {
  static RegexConstants? _instance;
  static RegexConstants get instance {
    if (_instance != null) {
      return _instance!;
    }
    _instance = RegexConstants._init();
    return _instance!;
  }

  RegexConstants._init();

  final String emailRegex =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9\w-]+\.[a-zA-Z]+";
  final String passwordRegex =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
}

extension StringValidatorExtension on String? {
  bool get isNullOrEmpty => this?.isEmpty ?? false;
  bool get isNotNullOrNoEmpty => this?.isNotEmpty ?? false;

  bool get isValidEmail => this != null
      ? RegExp(RegexConstants.instance.emailRegex).hasMatch(this!)
      : false;
  bool get isValidPassword => this != null
      ? RegExp(RegexConstants.instance.passwordRegex).hasMatch(this!)
      : false;
}
