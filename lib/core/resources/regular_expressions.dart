abstract class Patterns {
//  ^:          Asserts the beginning of the input.
// (?=...):     Positive lookahead. It checks if the input contains the specified pattern ahead.
// .*[0-9!@#$%^&*()_+{}\[\]:;<>,.?~]`:
//              Matches any character zero or more times, followed by at least one number or special character.
// .*[A-Z]:     Matches any character zero or more times, followed by at least one capital letter.
// .{8,}:       Matches any character (except for a newline) at least 8 times.
  static const String containsNumberOrSpecialCharacter =
      r'^(?=.*[0-9!@#$%^&*()_+{}\[\]:;<>,.?~`])';
  static const String hasMinimum8CharsWithCapitalLetter = r'^(?=.*[A-Z]).{8,}$';
  static const validPassword =
      r'^(?=.*[0-9!@#$%^&*()_+{}\[\]:;<>,.?~`])(?=.*[A-Z]).{8,}$';
}
