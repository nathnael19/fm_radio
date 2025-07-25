import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_am.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
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
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

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
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('am'),
    Locale('en')
  ];

  /// No description provided for @home_page_live_page_first_tab_bar.
  ///
  /// In en, this message translates to:
  /// **'Live'**
  String get home_page_live_page_first_tab_bar;

  /// No description provided for @home_page_live_page_second_tab_bar.
  ///
  /// In en, this message translates to:
  /// **'News'**
  String get home_page_live_page_second_tab_bar;

  /// No description provided for @home_page_live_page_third_tab_bar.
  ///
  /// In en, this message translates to:
  /// **'Podcasts'**
  String get home_page_live_page_third_tab_bar;

  /// No description provided for @home_page_live_page_bottom_tabbar_one.
  ///
  /// In en, this message translates to:
  /// **'Recent Live'**
  String get home_page_live_page_bottom_tabbar_one;

  /// No description provided for @home_page_live_page_bottom_tabbar_two.
  ///
  /// In en, this message translates to:
  /// **'Currency'**
  String get home_page_live_page_bottom_tabbar_two;

  /// No description provided for @home_page_live_page_bottom_tabbar_three.
  ///
  /// In en, this message translates to:
  /// **'Weather'**
  String get home_page_live_page_bottom_tabbar_three;

  /// No description provided for @home_page_live_page_bottom_tabbar_four.
  ///
  /// In en, this message translates to:
  /// **'Today\'s Programs'**
  String get home_page_live_page_bottom_tabbar_four;

  /// No description provided for @home_page_news_page_first_tab_bar.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get home_page_news_page_first_tab_bar;

  /// No description provided for @tip_creator_text.
  ///
  /// In en, this message translates to:
  /// **'Tip Creator'**
  String get tip_creator_text;

  /// No description provided for @home_page_news_page_second_tab_bar.
  ///
  /// In en, this message translates to:
  /// **'Sports'**
  String get home_page_news_page_second_tab_bar;

  /// No description provided for @home_page_news_page_third_tab_bar.
  ///
  /// In en, this message translates to:
  /// **'Foreign News'**
  String get home_page_news_page_third_tab_bar;

  /// No description provided for @home_page_news_page_fourth_tab_bar.
  ///
  /// In en, this message translates to:
  /// **'Business'**
  String get home_page_news_page_fourth_tab_bar;

  /// No description provided for @home_page_news_page_fifth_tab_bar.
  ///
  /// In en, this message translates to:
  /// **'Others'**
  String get home_page_news_page_fifth_tab_bar;

  /// No description provided for @deleted_item_message.
  ///
  /// In en, this message translates to:
  /// **'This item has been deleted'**
  String get deleted_item_message;

  /// No description provided for @donwload_page_delete_item.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get donwload_page_delete_item;

  /// No description provided for @home_page_news_page_open_all.
  ///
  /// In en, this message translates to:
  /// **'Open All'**
  String get home_page_news_page_open_all;

  /// No description provided for @profile_page_title.
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get profile_page_title;

  /// No description provided for @profile_page_notification.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get profile_page_notification;

  /// No description provided for @profile_page_language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get profile_page_language;

  /// No description provided for @profile_page_about.
  ///
  /// In en, this message translates to:
  /// **'About FM Radio'**
  String get profile_page_about;

  /// No description provided for @saved_page_title.
  ///
  /// In en, this message translates to:
  /// **'Collections'**
  String get saved_page_title;

  /// No description provided for @saved_page_no_saved.
  ///
  /// In en, this message translates to:
  /// **'No saved files'**
  String get saved_page_no_saved;

  /// No description provided for @donwload_page_title.
  ///
  /// In en, this message translates to:
  /// **'Downloaded Files'**
  String get donwload_page_title;

  /// No description provided for @donwload_page_no_downloads.
  ///
  /// In en, this message translates to:
  /// **'No downloaded files'**
  String get donwload_page_no_downloads;

  /// No description provided for @group_page_title.
  ///
  /// In en, this message translates to:
  /// **'Groups'**
  String get group_page_title;

  /// No description provided for @group_page_no_groups.
  ///
  /// In en, this message translates to:
  /// **'No groups available'**
  String get group_page_no_groups;

  /// No description provided for @group_page_search_hint.
  ///
  /// In en, this message translates to:
  /// **'Group Name'**
  String get group_page_search_hint;

  /// No description provided for @group_page_my_groups.
  ///
  /// In en, this message translates to:
  /// **'My Groups'**
  String get group_page_my_groups;

  /// No description provided for @group_page_explore_groups.
  ///
  /// In en, this message translates to:
  /// **'Explore Groups'**
  String get group_page_explore_groups;

  /// No description provided for @group_page_search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get group_page_search;

  /// No description provided for @group_page_members.
  ///
  /// In en, this message translates to:
  /// **'Members'**
  String get group_page_members;

  /// No description provided for @group_page_join_text.
  ///
  /// In en, this message translates to:
  /// **'Join'**
  String get group_page_join_text;

  /// No description provided for @amhric.
  ///
  /// In en, this message translates to:
  /// **'አማርኛ'**
  String get amhric;

  /// No description provided for @english.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// No description provided for @breaking_news.
  ///
  /// In en, this message translates to:
  /// **'Breaking News'**
  String get breaking_news;

  /// No description provided for @login_page_title.
  ///
  /// In en, this message translates to:
  /// **'Sign in'**
  String get login_page_title;

  /// No description provided for @email_or_phone.
  ///
  /// In en, this message translates to:
  /// **'Email/Phone'**
  String get email_or_phone;

  /// No description provided for @your_answer_text.
  ///
  /// In en, this message translates to:
  /// **'Your answer'**
  String get your_answer_text;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @forgot_password_text.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password?'**
  String get forgot_password_text;

  /// No description provided for @login_text.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login_text;

  /// No description provided for @signup_question.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an Account? '**
  String get signup_question;

  /// No description provided for @signup_text.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get signup_text;

  /// No description provided for @signup_page_title.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get signup_page_title;

  /// No description provided for @full_name.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get full_name;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @phone_number.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get phone_number;

  /// No description provided for @confirm_pass.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirm_pass;

  /// No description provided for @create_acc.
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get create_acc;

  /// No description provided for @or.
  ///
  /// In en, this message translates to:
  /// **'or'**
  String get or;

  /// No description provided for @signup_page_question.
  ///
  /// In en, this message translates to:
  /// **'Have an Account? '**
  String get signup_page_question;

  /// No description provided for @signin_text.
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get signin_text;

  /// No description provided for @forgot_page_title.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password'**
  String get forgot_page_title;

  /// No description provided for @forgot_page_desc.
  ///
  /// In en, this message translates to:
  /// **'Enter your phone number and we\'ll send you a code to reset your password.'**
  String get forgot_page_desc;

  /// No description provided for @send_code.
  ///
  /// In en, this message translates to:
  /// **'Send Code'**
  String get send_code;

  /// No description provided for @reset_page_title.
  ///
  /// In en, this message translates to:
  /// **'Enter Code'**
  String get reset_page_title;

  /// No description provided for @reset_page_desc.
  ///
  /// In en, this message translates to:
  /// **'A reset code has been sent to '**
  String get reset_page_desc;

  /// No description provided for @confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// No description provided for @resend_text.
  ///
  /// In en, this message translates to:
  /// **'Resend code?'**
  String get resend_text;

  /// No description provided for @new_pass_page_title.
  ///
  /// In en, this message translates to:
  /// **'Set New Password'**
  String get new_pass_page_title;

  /// No description provided for @new_pass.
  ///
  /// In en, this message translates to:
  /// **'New Password'**
  String get new_pass;

  /// No description provided for @new_conf_pass.
  ///
  /// In en, this message translates to:
  /// **'Confirm New Password'**
  String get new_conf_pass;

  /// No description provided for @continue_text.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continue_text;

  /// No description provided for @form_email_error.
  ///
  /// In en, this message translates to:
  /// **'Enter a valid email'**
  String get form_email_error;

  /// No description provided for @form_pass_error.
  ///
  /// In en, this message translates to:
  /// **'Password must be greater than 8 characters'**
  String get form_pass_error;

  /// No description provided for @form_pass_error2.
  ///
  /// In en, this message translates to:
  /// **'Passwords doesn\'t match'**
  String get form_pass_error2;

  /// No description provided for @form_phone_error.
  ///
  /// In en, this message translates to:
  /// **'Phone Number cannot be empty of greater than or less than 10 character'**
  String get form_phone_error;

  /// No description provided for @form_name_error.
  ///
  /// In en, this message translates to:
  /// **'Enter a valid full name'**
  String get form_name_error;

  /// No description provided for @logout_text.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout_text;

  /// No description provided for @only_fm.
  ///
  /// In en, this message translates to:
  /// **'Only from FM 107.8'**
  String get only_fm;

  /// No description provided for @from_other_fm.
  ///
  /// In en, this message translates to:
  /// **'From Organizers'**
  String get from_other_fm;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['am', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'am':
      return AppLocalizationsAm();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
