import 'package:flutter/material.dart';
import 'package:passman/core/enum/encryption_type_enum.dart';
import 'package:passman/core/provider/settings_provider.dart';
import 'package:passman/features/auth/viewmodel/auth_viewmodel.dart';
import 'package:passman/l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class EncryptionSettingsPage extends StatelessWidget {
  const EncryptionSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final authViewmodelProvider = Provider.of<AuthViewmodel>(
      context,
      listen: true,
    );
    final settingsProvider = Provider.of<SettingsProvider>(
      context,
      listen: false,
    );
    final localization = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                localization.pwEncrptionAlgorithm,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              RadioGroup<EncryptionTypeEnum>(
                onChanged: (value) {
                  authViewmodelProvider.addEncryptionAlgorithm(value!.name);
                },
                groupValue: settingsProvider.selectedEncryptionAlgorithm,
                child: Column(
                  children: EncryptionTypeEnum.values
                      .map(
                        (e) => RadioListTile<EncryptionTypeEnum>(
                          activeColor: Theme.of(context).primaryColor,
                          selected: EncryptionTypeEnum.values.contains(
                            settingsProvider.selectedEncryptionAlgorithm,
                          ),
                          value: e,
                          title: Text(e.name.toUpperCase()),
                          controlAffinity: ListTileControlAffinity.leading,
                        ),
                      )
                      .toList(),
                ),
              ),

              Text(localization.pwEncryptionAlgorithmSubtitle),
            ],
          ),
        ),
      ),
    );
  }
}
