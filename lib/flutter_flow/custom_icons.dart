import 'package:flutter/widgets.dart';

class FFIcons {
  FFIcons._();

  static const String _withdrawlFamily = 'Withdrawl';
  static const String _depositFamily = 'Deposit';
  static const String _yieldFamily = 'Yield';

  // withdrawl
  static const IconData kvector1 =
      IconData(0xe900, fontFamily: _withdrawlFamily);
  static const IconData kvector =
      IconData(0xe901, fontFamily: _withdrawlFamily);

  // deposit
  static const IconData kdeposit = IconData(0xe900, fontFamily: _depositFamily);

  // yield
  static const IconData kyiel = IconData(0xe900, fontFamily: _yieldFamily);
}
