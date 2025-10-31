import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:passman/core/config/constants.dart';
import 'package:passman/core/provider/settings_provider.dart';
import 'package:passman/features/auth/viewmodel/auth_viewmodel.dart';
import 'package:passman/features/home/view/widgets/custom_list_tile.dart';
import 'package:passman/features/home/view/widgets/styled_field.dart';
import 'package:provider/provider.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late TextEditingController _nameController;
  @override
  void initState() {
    _animationController = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    );
    _nameController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authViewmoderProvider = Provider.of<AuthViewmodel>(
      context,
      listen: true,
    );
    final settingsProvider = Provider.of<SettingsProvider>(
      context,
      listen: true,
    );

    _nameController.value = TextEditingValue(text: settingsProvider.userName);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            spacing: 10.0,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20.0),
              Stack(
                children: [
                  Center(
                    child: Container(
                      height: 90.0,
                      width: 90.0,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Theme.of(context).primaryColor,
                        ),
                        borderRadius: BorderRadius.circular(50.0),
                        image: DecorationImage(
                          image: AssetImage(
                            settingsProvider.userSelectedAvatar,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Opacity(
                        opacity: 0.6,
                        child: IconButton(
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return BottomSheet(
                                  onClosing: () {},
                                  builder: (context) {
                                    return Column(
                                      children: [
                                        Text(
                                          "Available avatars",
                                          style: Theme.of(
                                            context,
                                          ).textTheme.headlineMedium,
                                        ),
                                        Expanded(
                                          child: GridView.builder(
                                            itemCount: Constants
                                                .avalaibleAvatars
                                                .length,
                                            gridDelegate:
                                                SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 2,
                                                  mainAxisSpacing: 8.0,
                                                  crossAxisSpacing: 8.0,
                                                ),
                                            itemBuilder: (context, index) {
                                              String avatar = Constants
                                                  .avalaibleAvatars[index];
                                              String currentSelected =
                                                  settingsProvider
                                                      .userSelectedAvatar;
                                              return InkWell(
                                                onTap: () {
                                                  authViewmoderProvider
                                                      .addSelectedAvatar(
                                                        avatar,
                                                      );
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          50.0,
                                                        ),
                                                    border:
                                                        currentSelected ==
                                                            avatar
                                                        ? Border.all(
                                                            color: Theme.of(
                                                              context,
                                                            ).primaryColor,
                                                          )
                                                        : null,
                                                    image: DecorationImage(
                                                      image: AssetImage(avatar),
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                            );
                          },
                          icon: Icon(Icons.edit),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12.0),
              // Name
              StyledField(
                controller: _nameController,
                hintText: "Enter your name",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                onChange: (text) {
                  authViewmoderProvider.addUserName(text);
                },
              ),

              SizedBox(height: 4.0),
              // Setting
              CustomListTile(
                leadingIcon: LucideIcons.lockKeyhole,
                title: "Security",
                subtitle: "Change password, self-destrution",
                onTap: () {},
              ),
              CustomListTile(
                leadingIcon: LucideIcons.badgeInfo,
                title: "About App",
                subtitle: "Author, Terms, Licenses",
                onTap: () {
                  showModalBottomSheet(
                    isScrollControlled: true,
                    useSafeArea: true,
                    transitionAnimationController: _animationController,
                    context: context,
                    builder: (context) => BottomSheet(
                      onClosing: () {},
                      builder: (context) => Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              spacing: 10.0,
                              children: [
                                CircleAvatar(
                                  backgroundImage: NetworkImage(
                                    "https://avatars.githubusercontent.com/u/126248971?v=4",
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "wishrohitv",
                                      style: Theme.of(
                                        context,
                                      ).textTheme.headlineSmall,
                                    ),
                                    Text("author & developer"),
                                  ],
                                ),
                              ],
                            ),
                            Expanded(
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 20),
                                    Text(
                                      "MIT License",
                                      style: Theme.of(
                                        context,
                                      ).textTheme.titleLarge,
                                    ),
                                    Text(
                                      "Copyright (c) 2024 wishrohitv",
                                      style: Theme.of(
                                        context,
                                      ).textTheme.bodyMedium,
                                    ),
                                    Text(
                                      """Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
                              
                                                The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
                              
                                                THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.""",
                                      style: Theme.of(
                                        context,
                                      ).textTheme.bodySmall,
                                    ),
                                    SizedBox(height: 20),
                                    Text(
                                      "Privacy Notice",
                                      style: Theme.of(
                                        context,
                                      ).textTheme.titleLarge,
                                    ),
                                    Text(
                                      "This app only collects and stores your name and account credentials locally on your device. No data is collected, transmitted, or used for profit. This is a completely open-source project.",
                                      style: Theme.of(
                                        context,
                                      ).textTheme.bodySmall,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
