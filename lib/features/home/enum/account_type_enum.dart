import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class AccountType {
  final String typeName;
  final IconData iconData;
  const AccountType({required this.iconData, required this.typeName});
}

enum AccountTypeEnum {
  social(AccountType(iconData: Icons.people_alt_outlined, typeName: 'Social')),
  work(AccountType(iconData: Icons.work_outline, typeName: 'Work')),
  game(AccountType(iconData: LucideIcons.gamepad2, typeName: 'Games')),
  music(AccountType(iconData: LucideIcons.music, typeName: 'Music')),
  others(AccountType(iconData: LucideIcons.bookLock, typeName: 'Others'));

  final AccountType accountType;
  const AccountTypeEnum(this.accountType);
}
