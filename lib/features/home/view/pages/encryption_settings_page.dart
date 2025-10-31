import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:passman/core/enum/encryption_type_enum.dart';

class EncryptionSettingsPage extends StatelessWidget {
  const EncryptionSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false),
      body: SafeArea(
        child: Column(
          children: [
            Text("Password encrpytion algorithm"),

            ListTile(
              leading: Icon(LucideIcons.hash),
              title: DropdownMenuTheme(
                data: DropdownMenuThemeData(
                  menuStyle: MenuStyle(
                    padding: WidgetStatePropertyAll(EdgeInsetsGeometry.zero),
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(12.0),
                      ),
                    ),
                  ),
                ),
                child: DropdownButton(
                  value: EncryptionTypeEnum.aes256cbc,
                  items: [
                    DropdownMenuItem(
                      value: EncryptionTypeEnum.aes256cbc,
                      child: Text("AES256CBC"),
                    ),
                    DropdownMenuItem(
                      value: EncryptionTypeEnum.xor,
                      child: Text("XOR"),
                    ),
                  ],
                  onChanged: (value) {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
