import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:passman/core/themes/theme_colors.dart';
import 'package:passman/core/utils/gen_random_text.dart';
import 'package:passman/core/utils/loader.dart';
import 'package:passman/l10n/app_localizations.dart';

class PasswordGeneratorPage extends StatefulWidget {
  const PasswordGeneratorPage({super.key});

  @override
  State<PasswordGeneratorPage> createState() => _PasswordGeneratorPageState();
}

class _PasswordGeneratorPageState extends State<PasswordGeneratorPage> {
  bool numberIncluded = true;
  bool symboleIncluded = true;
  int passwordLength = 12;
  String generatedPassword = "";
  void generatePW() {
    setState(() {
      generatedPassword = generateRandomText(
        length: passwordLength,
        includeNum: numberIncluded,
        includeSymbol: symboleIncluded,
      );
    });
  }

  @override
  void initState() {
    generatePW();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: const Text('Password Generator')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              height: 300.0,
              decoration: BoxDecoration(
                color: ThemeColors.cardTintColor,
                border: Border.all(color: Theme.of(context).primaryColor),
                borderRadius: BorderRadius.circular(8.0),
              ),
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          generatedPassword,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Switch(
                      value: numberIncluded,
                      onChanged: (value) {
                        setState(() {
                          numberIncluded = value;
                          generatePW();
                        });
                      },
                    ),
                    Text(localization.includeNumbers),
                  ],
                ),
                Column(
                  children: [
                    Switch(
                      value: symboleIncluded,
                      onChanged: (value) {
                        setState(() {
                          symboleIncluded = value;
                          generatePW();
                        });
                      },
                    ),
                    Text(localization.includeSymbols),
                  ],
                ),
              ],
            ),

            SizedBox(
              height: 50.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 92,
                itemBuilder: (context, index) {
                  int i = index + 8;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        passwordLength = i;
                        generatePW();
                      });
                    },
                    child: Container(
                      width: 50,
                      margin: const EdgeInsets.all(4.0),
                      decoration: BoxDecoration(
                        color: passwordLength == index + 8
                            ? Theme.of(context).primaryColor
                            : ThemeColors.cardTintColor,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        '$i',
                        style: TextStyle(
                          color: passwordLength == index + 8
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton.outlined(
                  onPressed: () {
                    Clipboard.setData(ClipboardData(text: generatedPassword));
                    Loader().showLoader(
                      context,
                      widget: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.check,
                            color: Colors.lightGreenAccent,
                          ),
                          Text(localization.copied),
                        ],
                      ),
                    );
                  },
                  icon: Icon(Icons.copy),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
