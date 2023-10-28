import 'app_localizations.dart';

/// The translations for English (`en`).
class L10nEn extends L10n {
  L10nEn([String locale = 'en']) : super(locale);

  @override
  String get languageSelect => 'English';

  @override
  String get next => 'Next';

  @override
  String get takeStepWorldMeals => 'Take a Step Into The Enchanting World of Meals';

  @override
  String get awaitYou => 'Thousands of Delightful Recipes Await You';

  @override
  String get clickBegin => 'Click to Begin Cooking Right Away';

  @override
  String get signIn => 'Sign In';

  @override
  String get dontHaveAccount => 'Don\'t You Have an Account?';

  @override
  String get signUp => 'Sign Up';

  @override
  String get email => 'Email';

  @override
  String get validEmailMessage => 'Please Enter a Valid E-Mail Address';

  @override
  String get validPasswordMesaage => 'Please Enter The Password';

  @override
  String get password => 'Password';

  @override
  String get doHaveAccount => 'Do You Have an Account?';

  @override
  String get nameMessage => 'Please Enter Your Name';

  @override
  String get name => 'Name';

  @override
  String get surname => 'Surname';

  @override
  String get surnameMessage => 'Please Enter Your Surname';

  @override
  String get exitMessage => 'Checking Out';
}
