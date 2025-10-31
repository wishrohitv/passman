import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:passman/core/themes/theme_colors.dart';
import 'package:passman/core/utils/loader.dart';
import 'package:passman/features/home/enum/account_category_enum.dart';
import 'package:passman/features/home/models/account_model.dart';
import 'package:passman/features/home/viewmodel/home_viewmodel.dart';
import 'package:provider/provider.dart';

class LoginTileCard extends StatelessWidget {
  final AccountModel accountModel;
  const LoginTileCard({super.key, required this.accountModel});

  @override
  Widget build(BuildContext context) {
    final homeViewmodelProvider = Provider.of<HomeViewmodel>(
      context,
      listen: false,
    );
    return Container(
      height: 80.0,
      padding: EdgeInsets.symmetric(horizontal: 14.0),
      decoration: BoxDecoration(
        color: ThemeColors.cardTintColor,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: InkWell(
        onLongPress: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text("Delete"),
              content: Text("This action can't be undone"),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("Cancel"),
                ),
                TextButton(
                  onPressed: () {
                    homeViewmodelProvider.deleteAccounts(accountModel.id);

                    Navigator.pop(context);
                  },
                  child: Text("Delete", style: TextStyle(color: Colors.red)),
                ),
              ],
            ),
          );
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                spacing: 10.0,
                children: [
                  CircleAvatar(child: Icon(_getIconData(accountModel.icon))),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          accountModel.siteName,
                          style: Theme.of(context).textTheme.titleLarge!
                              .copyWith(fontWeight: FontWeight.w400),
                        ),
                        Text(
                          accountModel.email,
                          maxLines: 1,
                          overflow: TextOverflow.fade,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () async {
                    Clipboard.setData(
                      ClipboardData(
                        text:
                            (await homeViewmodelProvider.decryptData(
                              accountModel.password,
                            )) ??
                            "",
                      ),
                    );

                    Loader().showLoader(
                      context,
                      widget: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            LucideIcons.check,
                            color: Colors.lightGreenAccent,
                          ),
                          Text("Coppied"),
                        ],
                      ),
                    );
                  },
                  icon: Icon(LucideIcons.copy),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  IconData? _getIconData(String iconName) {
    try {
      return AccountCategoryEnum.values
          .byName(iconName.toLowerCase())
          .accountCategoryType
          .iconData;
    } catch (e) {
      return Icons.broken_image_outlined;
    }
  }
}
