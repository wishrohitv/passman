import 'package:flutter/material.dart';
import 'package:passman/core/widgets/custom_button.dart';
import 'package:passman/features/auth/view/widgets/setup_pin_dialog.dart';

class SetupPage extends StatelessWidget {
  const SetupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 12.0,
          children: [
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Icon(Icons.vpn_lock_sharp, size: 70.0)],
            ),
            Text(
              "PassMan",
              style: Theme.of(
                context,
              ).textTheme.headlineLarge!.copyWith(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 140.0),
            IconButton.filled(
              style: ButtonStyle(
                fixedSize: WidgetStatePropertyAll(Size(70.0, 70.0)),
                iconSize: WidgetStatePropertyAll(30.0),
              ),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) => BottomSheet(
                    onClosing: () {},
                    builder: (context) {
                      bool isChecked = false;
                      return SizedBox(
                        height: 200.0,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: StatefulBuilder(
                            builder: (context, setState) {
                              return Column(
                                children: [
                                  CheckboxListTile(
                                    value: isChecked,
                                    onChanged: (value) {
                                      setState(() => isChecked = value!);
                                    },
                                    controlAffinity:
                                        ListTileControlAffinity.leading,
                                    title: Text(
                                      "Agree to the policy and terms",
                                    ),
                                  ),
                                  Spacer(),
                                  Opacity(
                                    opacity: isChecked ? 1 : 0.3,
                                    child: CustomButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                        showDialog(
                                          context: context,
                                          builder: (context) =>
                                              Dialog.fullscreen(
                                                child: SetupPinDialog(),
                                              ),
                                        );
                                      },
                                      text: "Continue",
                                    ),
                                  ),
                                  SizedBox(height: 10.0),
                                ],
                              );
                            },
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
              icon: Icon(Icons.arrow_forward),
            ),
          ],
        ),
      ),
    );
  }
}
