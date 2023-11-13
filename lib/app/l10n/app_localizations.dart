import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_tr.dart';

/// Callers can lookup localized strings with an instance of L10n
/// returned by `L10n.of(context)`.
///
/// Applications need to include `L10n.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: L10n.localizationsDelegates,
///   supportedLocales: L10n.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the L10n.supportedLocales
/// property.
abstract class L10n {
  L10n(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static L10n? of(BuildContext context) {
    return Localizations.of<L10n>(context, L10n);
  }

  static const LocalizationsDelegate<L10n> delegate = _L10nDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('tr')
  ];

  /// No description provided for @languageSelect.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get languageSelect;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @takeStepWorldMeals.
  ///
  /// In en, this message translates to:
  /// **'Take a Step Into The Enchanting World of Meals'**
  String get takeStepWorldMeals;

  /// No description provided for @awaitYou.
  ///
  /// In en, this message translates to:
  /// **'Thousands of Delightful Recipes Await You'**
  String get awaitYou;

  /// No description provided for @clickBegin.
  ///
  /// In en, this message translates to:
  /// **'Click to Begin Cooking Right Away'**
  String get clickBegin;

  /// No description provided for @signIn.
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get signIn;

  /// No description provided for @dontHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Don\'t You Have an Account?'**
  String get dontHaveAccount;

  /// No description provided for @signUp.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get signUp;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @validEmailMessage.
  ///
  /// In en, this message translates to:
  /// **'Please Enter a Valid E-Mail Address'**
  String get validEmailMessage;

  /// No description provided for @validPasswordMessage.
  ///
  /// In en, this message translates to:
  /// **'Please Enter a Valid Password'**
  String get validPasswordMessage;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @doHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Do You Have an Account?'**
  String get doHaveAccount;

  /// No description provided for @nameMessage.
  ///
  /// In en, this message translates to:
  /// **'Please Enter Your Name'**
  String get nameMessage;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// No description provided for @surname.
  ///
  /// In en, this message translates to:
  /// **'Surname'**
  String get surname;

  /// No description provided for @surnameMessage.
  ///
  /// In en, this message translates to:
  /// **'Please Enter Your Surname'**
  String get surnameMessage;

  /// No description provided for @exitMessage.
  ///
  /// In en, this message translates to:
  /// **'Checking Out'**
  String get exitMessage;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @resetPassword.
  ///
  /// In en, this message translates to:
  /// **'Reset Password'**
  String get resetPassword;

  /// No description provided for @notifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// No description provided for @theme.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get theme;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @successLoginMessage.
  ///
  /// In en, this message translates to:
  /// **'You Are Redirected To The Homepage'**
  String get successLoginMessage;

  /// No description provided for @inCorrectEmailFormatMessage.
  ///
  /// In en, this message translates to:
  /// **'The Email Format Is Incorrect'**
  String get inCorrectEmailFormatMessage;

  /// No description provided for @inCorrectEmailPasswordMessage.
  ///
  /// In en, this message translates to:
  /// **'The Email or Password is Incorrect'**
  String get inCorrectEmailPasswordMessage;

  /// No description provided for @about.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get about;

  /// No description provided for @privacy.
  ///
  /// In en, this message translates to:
  /// **'Privacy'**
  String get privacy;

  /// No description provided for @categories.
  ///
  /// In en, this message translates to:
  /// **'Categories'**
  String get categories;

  /// No description provided for @myFavorites.
  ///
  /// In en, this message translates to:
  /// **'My Favorites'**
  String get myFavorites;

  /// No description provided for @recipeDetails.
  ///
  /// In en, this message translates to:
  /// **'Recipe Details'**
  String get recipeDetails;

  /// No description provided for @iRecipe.
  ///
  /// In en, this message translates to:
  /// **'iRecipe'**
  String get iRecipe;

  /// No description provided for @myProfile.
  ///
  /// In en, this message translates to:
  /// **'My Profile'**
  String get myProfile;

  /// No description provided for @favorites.
  ///
  /// In en, this message translates to:
  /// **'Favorites'**
  String get favorites;

  /// No description provided for @welcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome'**
  String get welcome;

  /// No description provided for @myRecipe.
  ///
  /// In en, this message translates to:
  /// **'My Recipe'**
  String get myRecipe;

  /// No description provided for @personalInfo.
  ///
  /// In en, this message translates to:
  /// **'Personal Info'**
  String get personalInfo;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @add.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get add;

  /// No description provided for @materials.
  ///
  /// In en, this message translates to:
  /// **'Materials'**
  String get materials;

  /// No description provided for @preparation.
  ///
  /// In en, this message translates to:
  /// **'Preparation'**
  String get preparation;

  /// No description provided for @foodName.
  ///
  /// In en, this message translates to:
  /// **'Food Name'**
  String get foodName;

  /// No description provided for @foodNameMessage.
  ///
  /// In en, this message translates to:
  /// **'Please Enter Food Name'**
  String get foodNameMessage;

  /// No description provided for @materialsMessage.
  ///
  /// In en, this message translates to:
  /// **'Please Enter Materials'**
  String get materialsMessage;

  /// No description provided for @preparationMessage.
  ///
  /// In en, this message translates to:
  /// **'Please Enter Preparation'**
  String get preparationMessage;

  /// No description provided for @imageLinkMessage.
  ///
  /// In en, this message translates to:
  /// **'Please Enter Image Link'**
  String get imageLinkMessage;

  /// No description provided for @imageLink.
  ///
  /// In en, this message translates to:
  /// **'Image Link'**
  String get imageLink;

  /// No description provided for @exampleLink.
  ///
  /// In en, this message translates to:
  /// **'https://example.com/image'**
  String get exampleLink;

  /// No description provided for @aboutDescription.
  ///
  /// In en, this message translates to:
  /// **'Welcome to the iRecipe Family!\n\nDiscover the Chef Inside\niRecipe is designed to push the boundaries of taste and start your own culinary adventure.\nWe offer a wonderful platform with thousands of unique recipes, easy usability, and the opportunity to unleash your creativity.\nApplication Features:\nExtensive and Diverse Recipes: From main courses to desserts, soups to appetizers, iRecipe has a wide collection of recipes that cater to every palate.\nAdd to Favorites and Personalize: Create your personal collection by adding your favorite recipes. Add your own recipes and bring your own flavor to this enchanting world.\nCategorized Recipes: Quickly access recipes that suit your needs. Each category, from main courses to dessert recipes, is carefully organized.\nCommunity Recipes: Share your creativity in the kitchen! Add your own recipes and share your experiences with other iRecipe users.\niRecipe is here to make the cooking experience more personal, interesting, and delicious. We invite everyone to join their own culinary adventures and embark on this flavorful journey!\nEnjoy and start exploring!'**
  String get aboutDescription;

  /// No description provided for @privacyDescription.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy\n\nProtecting your privacy is one of our top priorities as the iRecipe application.\nThis privacy policy explains how iRecipe collects, uses, limits, and protects your personal information.\nPlease read this policy carefully.\n\nCollection and Use of Personal Information\nWhen using the iRecipe application, we may collect certain personal information from you.\nThese may include identifying information such as your name, email address, and geographic location.\nWe may use this information to provide you with personalized experiences, fulfill your requests, communicate with you, and improve our services.\nHowever, we will not share or sell your personal information to third parties.\n\nCookies\nThe iRecipe application may use cookies.\nCookies are small text files that are stored on your computer or mobile device by your browser.\nThese cookies help us better understand the application and provide you with a better user experience.\nYou can choose to accept or reject cookies.\nHowever, enabling cookies may be necessary for certain features to function correctly.\n\nSecurity\nWe take necessary measures to ensure the security of your personal information.\nHowever, please note that communication over the internet or electronic storage methods are not completely secure.\nIt is entirely your responsibility to transmit any information to us or use the application.\n\nLinks to Other Websites\nThe iRecipe application may contain links to other websites or services.\nWe are not responsible for the privacy practices of these websites or services as we have no control over them.\nWe recommend reading the respective privacy policies before visiting these websites.\n\nChanges\nWe may update this privacy policy from time to time.\nWhen there are any updates, we will indicate the effective date of the changes.\nIt is important for you to regularly check this page to stay informed about the current policies.\n\nContact\nIf you have any questions or concerns regarding our privacy policy, please contact us.\nWe are happy to assist you.\nThis privacy policy explains the privacy practices of the iRecipe application.\nBy using our application, you acknowledge that you accept this policy.\n\nLast updated: [Current date]'**
  String get privacyDescription;
}

class _L10nDelegate extends LocalizationsDelegate<L10n> {
  const _L10nDelegate();

  @override
  Future<L10n> load(Locale locale) {
    return SynchronousFuture<L10n>(lookupL10n(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'tr'].contains(locale.languageCode);

  @override
  bool shouldReload(_L10nDelegate old) => false;
}

L10n lookupL10n(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return L10nEn();
    case 'tr': return L10nTr();
  }

  throw FlutterError(
    'L10n.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
