import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'ar'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? arText = '',
  }) =>
      [enText, arText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // HomePage
  {
    'dzmqd1ya': {
      'en': 'Total Balance',
      'ar': '',
    },
    'tr62awxs': {
      'en': 'AUD',
      'ar': '',
    },
    'ayttp2kz': {
      'en': ' / ',
      'ar': '',
    },
    'kpfcnfyw': {
      'en': 'USD',
      'ar': '',
    },
    '7tt4o1yq': {
      'en': 'EUR',
      'ar': '',
    },
    '7eav12z4': {
      'en': ' / ',
      'ar': '',
    },
    'clkyv586': {
      'en': 'USD',
      'ar': '',
    },
    'sr1qjb6g': {
      'en': 'GBP',
      'ar': '',
    },
    '5e47dkcv': {
      'en': ' / ',
      'ar': '',
    },
    '1p14vciv': {
      'en': 'USD',
      'ar': '',
    },
    'okg69ni5': {
      'en': 'NZD',
      'ar': '',
    },
    'czwbb4iu': {
      'en': ' / ',
      'ar': '',
    },
    '5kgvyy5y': {
      'en': 'USD',
      'ar': '',
    },
    '5zbhs54r': {
      'en': 'CAD',
      'ar': '',
    },
    '8bw1hdvn': {
      'en': ' / ',
      'ar': '',
    },
    '6n89loc8': {
      'en': 'USD',
      'ar': '',
    },
    'lm62pibz': {
      'en': 'CHF',
      'ar': '',
    },
    '6jr49jf5': {
      'en': ' / ',
      'ar': '',
    },
    'ikaeqqwc': {
      'en': 'USD',
      'ar': '',
    },
    'ss7dq4zr': {
      'en': 'JPY',
      'ar': '',
    },
    'imm8qckp': {
      'en': ' / ',
      'ar': '',
    },
    'ivy9afeo': {
      'en': 'USD',
      'ar': '',
    },
    'xdzb9t6g': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // Login
  {
    'w3dn2hi0': {
      'en': 'Login',
      'ar': '',
    },
    'g6eoqyds': {
      'en': 'Email',
      'ar': '',
    },
    'ht92luli': {
      'en': 'Password',
      'ar': '',
    },
    'xrcyb1dg': {
      'en': 'Login',
      'ar': '',
    },
    'au1h3wl7': {
      'en': 'Forgot Password?',
      'ar': '',
    },
    '3q03pl0f': {
      'en': 'Don\'t have an account? ',
      'ar': '',
    },
    '1cetpnlo': {
      'en': 'Register here',
      'ar': '',
    },
    '7y21n6vw': {
      'en': 'Home',
      'ar': '',
    },
  },
  // HistoryPage
  {
    '38pz7vq5': {
      'en': 'History',
      'ar': '',
    },
    'zws5vut9': {
      'en': 'Deposit',
      'ar': '',
    },
    '4eouor8q': {
      'en': 'Yield',
      'ar': '',
    },
    '1lj1bb0o': {
      'en': '+1.24%',
      'ar': '',
    },
    'lkq09o6q': {
      'en': 'Withdraw',
      'ar': '',
    },
    'o9tss0b8': {
      'en': '+1.24%',
      'ar': '',
    },
    'cxjhiweb': {
      'en': 'Commission',
      'ar': '',
    },
    'y16t6l9v': {
      'en': '+1.24%',
      'ar': '',
    },
    'edgxpi7f': {
      'en': 'History',
      'ar': '',
    },
  },
  // Register
  {
    'bsogqt17': {
      'en': 'Sign Up',
      'ar': '',
    },
    'xc5c4up2': {
      'en': 'TradeyPlus',
      'ar': '',
    },
    'kyqitvtn': {
      'en': 'www.tradeyplus.com',
      'ar': '',
    },
    'w7gky2a7': {
      'en': 'Click Here To Register',
      'ar': '',
    },
    'rqjpegj3': {
      'en': 'Already have an account? ',
      'ar': '',
    },
    'ld662ytv': {
      'en': 'Login',
      'ar': '',
    },
    'q0tdft9p': {
      'en': 'Home',
      'ar': '',
    },
  },
  // Profile
  {
    'd2jfzrhe': {
      'en': 'Balance: ',
      'ar': '',
    },
    'v36vqs0o': {
      'en': ' Package',
      'ar': '',
    },
    'f2go4u6e': {
      'en': 'Wallet',
      'ar': '',
    },
    '4p4zchqx': {
      'en': 'Export Data',
      'ar': '',
    },
    'yk0vhpqt': {
      'en': 'Log Out',
      'ar': '',
    },
    '8rtqp82g': {
      'en': 'Profile',
      'ar': '',
    },
  },
  // InvestmentCalculator
  {
    'v3x568tj': {
      'en': 'Investment Calculator',
      'ar': '',
    },
    'zwhvq5l9': {
      'en': 'Total Profit',
      'ar': '',
    },
    'a9jox3tw': {
      'en': '\$0',
      'ar': '',
    },
    'qdr3u0ir': {
      'en': 'Bill Amount',
      'ar': '',
    },
    'ppclz17f': {
      'en': '',
      'ar': '',
    },
    '4zujzxgg': {
      'en': 'Yield Percentage (8%)',
      'ar': '',
    },
    '96jr92mg': {
      'en': '3 Months',
      'ar': '',
    },
    'skhle4hw': {
      'en': '6 Months',
      'ar': '',
    },
    'i8q4ed1d': {
      'en': '9 Months',
      'ar': '',
    },
    'iwwzomol': {
      'en': '12 Months',
      'ar': '',
    },
    'ujv7ojr1': {
      'en': 'Period',
      'ar': '',
    },
    '9k69ewez': {
      'en': 'Search for an item...',
      'ar': '',
    },
    'xw8oe4n4': {
      'en': 'Calculator',
      'ar': '',
    },
  },
  // Transaction
  {
    '3xwurb9k': {
      'en': 'Account Balance',
      'ar': '',
    },
    'q35nrn0z': {
      'en': 'Request Withdrawal',
      'ar': '',
    },
    '2u89nm88': {
      'en': 'Request Deposit',
      'ar': '',
    },
    'kg0pw9t1': {
      'en': 'Yield Transfer',
      'ar': '',
    },
    'myfmqba2': {
      'en': 'Contact Us',
      'ar': '',
    },
    'rv541r0b': {
      'en': 'Financial Report',
      'ar': '',
    },
    '4y9di80p': {
      'en': 'Home',
      'ar': '',
    },
  },
  // Barchart
  {
    'alt2v3w0': {
      'en': 'Financial Report',
      'ar': '',
    },
    'd5zhii8w': {
      'en': '3 Months',
      'ar': '',
    },
    'w2pey891': {
      'en': '6 Months',
      'ar': '',
    },
    'ystj5cfm': {
      'en': '12 Months',
      'ar': '',
    },
    'ixnt6vsp': {
      'en': 'Bar Chart',
      'ar': '',
    },
    'qs28zna4': {
      'en': 'Pie Chart',
      'ar': '',
    },
    'f53kzi9r': {
      'en': 'Total Balance',
      'ar': '',
    },
    'sthoqvgr': {
      'en': 'Month',
      'ar': '',
    },
    '3ii22erj': {
      'en': 'Amount',
      'ar': '',
    },
    '2fqvzc46': {
      'en': 'Deposit',
      'ar': '',
    },
    'lzew5b3q': {
      'en': 'Profit',
      'ar': '',
    },
    'l45bdi9c': {
      'en': 'Deposit',
      'ar': '',
    },
    'oznaeblg': {
      'en': 'Yield',
      'ar': '',
    },
    'a95epurh': {
      'en': 'Withdraw',
      'ar': '',
    },
    'qx9h91ml': {
      'en': 'Commission',
      'ar': '',
    },
    'd6rxr02m': {
      'en': 'Date',
      'ar': '',
    },
    'sl69n0g5': {
      'en': 'Deposit',
      'ar': '',
    },
    'w253ubyi': {
      'en': 'Yield',
      'ar': '',
    },
    'wi6zknvq': {
      'en': '%',
      'ar': '',
    },
    'xgerrqro': {
      'en': 'Withdraw',
      'ar': '',
    },
    'tuwj0467': {
      'en': 'Balance',
      'ar': '',
    },
    'tae6j5vl': {
      'en': 'Summary',
      'ar': '',
    },
  },
  // EditProfile
  {
    '7ecc2zoh': {
      'en': 'Your Name',
      'ar': '',
    },
    '70zkn3fq': {
      'en': '',
      'ar': '',
    },
    'a6q6wnu5': {
      'en': '',
      'ar': '',
    },
    '5l1clr8k': {
      'en': 'Email',
      'ar': '',
    },
    '0o2b2ulh': {
      'en': '',
      'ar': '',
    },
    'cp5547hl': {
      'en': 'Phone Number',
      'ar': '',
    },
    'ovm1ro8h': {
      'en': '',
      'ar': '',
    },
    's3r2j8g3': {
      'en': 'Date of Birth',
      'ar': '',
    },
    'r0fpxvbk': {
      'en': '',
      'ar': '',
    },
    'vbtdimcq': {
      'en': '',
      'ar': '',
    },
    'te0wzduc': {
      'en': 'Address',
      'ar': '',
    },
    '6xafw6z7': {
      'en': '',
      'ar': '',
    },
    'w5kbhsxw': {
      'en': '',
      'ar': '',
    },
    'sewuq6ez': {
      'en': 'Name is required',
      'ar': '',
    },
    '521tjal9': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'l96ntvfp': {
      'en': 'Field is required',
      'ar': '',
    },
    'ey0lq4cs': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'id52ivuz': {
      'en': 'Field is required',
      'ar': '',
    },
    '5tho7ylq': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'qqnardpe': {
      'en': 'Address is required',
      'ar': '',
    },
    '9j2tw2rc': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'x3bzizho': {
      'en': 'Save Changes',
      'ar': '',
    },
    'keaiq67e': {
      'en': 'Profile',
      'ar': '',
    },
  },
  // RequestWithdraw
  {
    '8pufspr6': {
      'en': 'Request Withdrawal',
      'ar': '',
    },
    'u03z2e37': {
      'en': 'Send a withdrawal request to TradeyPlus',
      'ar': '',
    },
    'o2ilfdpz': {
      'en': 'Amount of Money',
      'ar': '',
    },
    '1dctyijw': {
      'en': 'Withdrawal',
      'ar': '',
    },
    'scfunpdl': {
      'en': 'Cancel',
      'ar': '',
    },
  },
  // Deposit
  {
    '6ytiluww': {
      'en': 'Request Deposit',
      'ar': '',
    },
    'q9qjcgg9': {
      'en': 'Send a deposit request to TradeyPlus',
      'ar': '',
    },
    'wgqjlfu4': {
      'en': 'Amount of Money',
      'ar': '',
    },
    '8qdqp60o': {
      'en': 'Deposit',
      'ar': '',
    },
    '7d1b1ekq': {
      'en': 'Cancel',
      'ar': '',
    },
  },
  // YieldTransfer
  {
    'zzksedvl': {
      'en': 'Yield Transfer',
      'ar': '',
    },
    'vwrsm07v': {
      'en': 'Send a transfer request to TradeyPlus',
      'ar': '',
    },
    'elavjlmv': {
      'en': 'Amount of Money',
      'ar': '',
    },
    '0ddcmhwj': {
      'en': 'Custom Wallet',
      'ar': '',
    },
    'v3sjvnyy': {
      'en': 'Custom Wallet',
      'ar': '',
    },
    'a85x6n9l': {
      'en': 'Trading Wallet',
      'ar': '',
    },
    '9lr8kigt': {
      'en': 'Stock Wallet',
      'ar': '',
    },
    'yxbuz7je': {
      'en': 'Choose Wallet',
      'ar': '',
    },
    'pivlr7el': {
      'en': 'Search for an item...',
      'ar': '',
    },
    'wh6834yv': {
      'en': 'Transfer',
      'ar': '',
    },
    'nz57qpu5': {
      'en': 'Cancel',
      'ar': '',
    },
  },
  // EmptyList
  {
    'k4q0ckfn': {
      'en': 'Empty List',
      'ar': '',
    },
    'uqct0kq3': {
      'en': 'It seems that you don\'t have any activity.',
      'ar': '',
    },
  },
  // SuccessDialog
  {
    'e2n18uuh': {
      'en': 'Request Submitted',
      'ar': '',
    },
    'o3revl70': {
      'en':
          'Thank you for submitting your request.\nWe will reach out to you shortly.',
      'ar': '',
    },
  },
  // Miscellaneous
  {
    'l8xgscnz': {
      'en': '',
      'ar': '',
    },
    'fq2nnvxz': {
      'en': '',
      'ar': '',
    },
    'svxhld5r': {
      'en': '',
      'ar': '',
    },
    'z1nxdx3j': {
      'en': '',
      'ar': '',
    },
    'f1080gid': {
      'en': '',
      'ar': '',
    },
    '2xiesld6': {
      'en': '',
      'ar': '',
    },
    '8qn62e4j': {
      'en': '',
      'ar': '',
    },
    'oqb2mc4p': {
      'en': '',
      'ar': '',
    },
    '62ysf7sa': {
      'en': '',
      'ar': '',
    },
    'vfhc3ram': {
      'en': '',
      'ar': '',
    },
    'hh6xy8bw': {
      'en': '',
      'ar': '',
    },
    'nxnbjk1u': {
      'en': '',
      'ar': '',
    },
    '7p0qzwi0': {
      'en': '',
      'ar': '',
    },
    'yihldmfn': {
      'en': '',
      'ar': '',
    },
    '6lx1y2lu': {
      'en': '',
      'ar': '',
    },
    'ygad0r5k': {
      'en': '',
      'ar': '',
    },
    'pur6jp9f': {
      'en': '',
      'ar': '',
    },
    'f4w59b25': {
      'en': '',
      'ar': '',
    },
    'y2sahf46': {
      'en': '',
      'ar': '',
    },
    'wgwilgur': {
      'en': '',
      'ar': '',
    },
    '5sbeqh2b': {
      'en': '',
      'ar': '',
    },
    'rufycz8f': {
      'en': '',
      'ar': '',
    },
    'kjpkiqxf': {
      'en': '',
      'ar': '',
    },
    '4bquz11s': {
      'en': '',
      'ar': '',
    },
    '8z9p5s3l': {
      'en': '',
      'ar': '',
    },
    '1ewv5l3e': {
      'en': '',
      'ar': '',
    },
  },
].reduce((a, b) => a..addAll(b));
