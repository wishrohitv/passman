import 'package:flutter/material.dart';
import 'package:passman/core/provider/settings_provider.dart';
import 'package:passman/core/utils/show_toast.dart';
import 'package:passman/features/auth/view/widgets/custom_pin_field.dart';
import 'package:passman/features/home/view/pages/bottom_nav_bar_page.dart';
import 'package:passman/features/home/viewmodel/home_viewmodel.dart';
import 'package:passman/l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class VerifyPinPage extends StatelessWidget {
  const VerifyPinPage({super.key});

  @override
  Widget build(BuildContext context) {
    final homeViewmodelProvider = Provider.of<HomeViewmodel>(
      context,
      listen: false,
    );
    final settinsProvider = Provider.of<SettingsProvider>(
      context,
      listen: false,
    );
    String enteredPin = "";
    return Scaffold(
      body: SafeArea(
        child: Column(
          spacing: 12.0,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppLocalizations.of(context)!.verifyItsYou,
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: CustomPinField(
                onChange: (fieldText) async {
                  enteredPin = "";
                  for (var pin in fieldText) {
                    enteredPin += pin;
                  }
                  if (enteredPin.length == 6) {
                    String? pw = settinsProvider.appPassword;
                    String? enterHashedPw = await homeViewmodelProvider
                        .hashData(enteredPin);
                    if (enterHashedPw == pw) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BottomNavBarPage(),
                        ),
                      );
                    } else {
                      showNotification(
                        AppLocalizations.of(context)!.incorrectPinMsg,
                      );
                    }
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
