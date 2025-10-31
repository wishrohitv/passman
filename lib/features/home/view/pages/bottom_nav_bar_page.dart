import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:passman/features/home/view/pages/account_page.dart';
import 'package:passman/features/home/view/pages/encryption_settings_page.dart';
import 'package:passman/features/home/view/pages/home_page.dart';
import 'package:passman/features/home/view/widgets/add_account_sheet.dart';
import 'package:passman/features/home/view/widgets/bottom_icon.dart';

class BottomNavBarPage extends StatefulWidget {
  const BottomNavBarPage({super.key});

  @override
  State<BottomNavBarPage> createState() => _BottomNavBarPageState();
}

class _BottomNavBarPageState extends State<BottomNavBarPage> {
  List<Widget> pages = [
    HomePage(),
    EncryptionSettingsPage(),
    Container(),
    AccountPage(),
  ];
  int currentIndex = 0;

  void changeBottomTabScreen(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: pages[currentIndex]),
      bottomNavigationBar: BottomAppBar(
        height: 62.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BottomIcon(
              onPressed: () => changeBottomTabScreen(0),
              icon: LucideIcons.house,
              isCheckd: currentIndex == 0,
            ),
            BottomIcon(
              onPressed: () => changeBottomTabScreen(1),
              icon: LucideIcons.lockKeyhole,
              isCheckd: currentIndex == 1,
            ),
            SizedBox(width: 60.0),
            BottomIcon(
              onPressed: () => changeBottomTabScreen(2),
              icon: LucideIcons.shieldCheck,
              isCheckd: currentIndex == 2,
            ),
            BottomIcon(
              onPressed: () => changeBottomTabScreen(3),
              icon: LucideIcons.userRound,
              isCheckd: currentIndex == 3,
            ),
          ],
        ),
      ),
      resizeToAvoidBottomInset: true,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            useSafeArea: true,
            isScrollControlled: true,
            context: context,
            builder: (context) {
              return Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: AddAccountSheet(),
              );
            },
          );
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(30.0),
        ),
        child: Icon(Icons.add, size: 30.0),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
