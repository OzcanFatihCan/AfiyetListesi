import 'package:afiyetlistesi/product/constants/project_validate_regex.dart';

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
