// Password Regex Expression with at least 1 uppercase, 1 lowercase,
// 1 digit and 1 special character, and the length should be between 8 to 16.
final RegExp passwordRegexExp =
    RegExp(r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,16}$');

final RegExp emailRegExp =
    RegExp(r'^[a-zA-Z0-9.a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

final RegExp usernameRegexExp = RegExp(r'^[a-zA-Z0-9_]{3,16}$');

final RegExp phoneRegexExp =
    RegExp(r'^(\+\d{1,2}\s?)?1?\-?\.?\s?\(?\d{3}\)?[\s.-]?\d{3}[\s.-]?\d{4}$');

final RegExp nameRegexExp = RegExp(r'^[a-zA-Z\s]*$');
