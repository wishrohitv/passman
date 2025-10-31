import 'package:flutter/material.dart';
import 'package:passman/core/widgets/custom_button.dart';
import 'package:passman/features/auth/viewmodel/auth_viewmodel.dart';
import 'package:passman/features/home/view/pages/bottom_nav_bar_page.dart';
import 'package:passman/features/home/view/widgets/custom_field.dart';
import 'package:passman/features/auth/view/widgets/custom_pin_field.dart';
import 'package:provider/provider.dart';

class SetupPinDialog extends StatefulWidget {
  const SetupPinDialog({super.key});

  @override
  State<SetupPinDialog> createState() => _SetupPinDialogState();
}

class _SetupPinDialogState extends State<SetupPinDialog> {
  final TextEditingController _nameController = TextEditingController();
  String initialPin = "";
  String confirmPin = "";

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authViewmodelProider = Provider.of<AuthViewmodel>(
      context,
      listen: false,
    );
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 12.0,
            children: [
              SizedBox(height: 60.0),
              Text("Enter Name"),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.80,
                child: CustomField(
                  controller: _nameController,
                  helperText: "Enter your name (Optional)",
                ),
              ),
              Text(
                "Enter Super PIN",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Text(
                "Only pin you need to remember",
                style: Theme.of(context).textTheme.labelSmall,
              ),
              SizedBox(
                width: 270.0,
                height: 50.0,
                child: CustomPinField(
                  onChange: (fieldText) {
                    // Clear first
                    initialPin = "";
                    for (var pin in fieldText) {
                      initialPin = initialPin += pin;
                    }
                  },
                ),
              ),

              SizedBox(height: 20.0),
              // Confirm pin
              Text(
                "Confirm Super PIN",
                style: Theme.of(context).textTheme.headlineMedium,
              ),

              SizedBox(
                width: 270.0,
                height: 50.0,
                child: CustomPinField(
                  onChange: (fieldText) {
                    // Clear first
                    confirmPin = "";
                    for (var pin in fieldText) {
                      confirmPin = confirmPin += pin;
                    }
                  },
                ),
              ),

              SizedBox(height: 80.0),
              CustomButton(
                onPressed: () async {
                  if (initialPin != confirmPin || initialPin.isEmpty) {
                    return;
                  }
                  // Initial setup
                  await authViewmodelProider.addUserName(_nameController.text);
                  await authViewmodelProider.addAppPassword(confirmPin);

                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BottomNavBarPage()),
                  );
                },
                text: "Continue",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
