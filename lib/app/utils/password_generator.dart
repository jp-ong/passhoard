import 'dart:math';

String generatePassword({int length = 12}) {
  const String lowercaseChars = 'abcdefghijklmnopqrstuvwxyz';
  const String uppercaseChars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  const String numericChars = '0123456789';
  const String specialChars = '!@#\$%^&*()-=_+[]{}|;:,.<>/?';

  String chars = lowercaseChars + uppercaseChars + numericChars + specialChars;
  Random random = Random.secure();

  String password = '';
  for (int i = 0; i < length; i++) {
    int randomIndex = random.nextInt(chars.length);
    password += chars[randomIndex];
  }

  return password;
}
