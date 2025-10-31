import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:passman/core/provider/settings_provider.dart';
import 'package:passman/features/home/view/widgets/tab_button.dart';
import 'package:passman/features/home/viewmodel/home_viewmodel.dart';
import 'package:provider/provider.dart';

class CustomAppBar extends StatelessWidget {
  final Widget body;
  final TabController tabController;
  const CustomAppBar({
    super.key,
    required this.body,
    required this.tabController,
  });

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return [appBar(context), flexibleWidget(context), tabBar(context)];
      },
      body: body,
    );
  }

  SliverAppBar appBar(BuildContext context) {
    final settingsProvider = Provider.of<SettingsProvider>(
      context,
      listen: true,
    );
    return SliverAppBar(
      // Top app bar
      automaticallyImplyLeading: false,
      scrolledUnderElevation: 0.0,
      pinned: true,
      flexibleSpace: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              spacing: 10.0,
              children: [
                CircleAvatar(
                  radius: 26.0,
                  backgroundImage: AssetImage(
                    settingsProvider.userSelectedAvatar,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome back",
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    Text(
                      settingsProvider.userName.isEmpty
                          ? "Your name"
                          : settingsProvider.userName,
                      style: Theme.of(context).textTheme.titleLarge,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ],
            ),
            Row(
              spacing: 6.0,
              children: [
                IconButton.filled(onPressed: () {}, icon: Icon(Icons.search)),
                IconButton.filled(
                  onPressed: () {},
                  icon: Icon(Icons.notifications_outlined),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  SliverAppBar flexibleWidget(BuildContext context) {
    final homeViewmodelProvider = Provider.of<HomeViewmodel>(
      context,
      listen: true,
    );
    return SliverAppBar(
      expandedHeight: 100.0,
      automaticallyImplyLeading: false,
      flexibleSpace:
          // Progress banner
          FlexibleSpaceBar(
            background: Container(
              margin: EdgeInsets.all(8.0),
              height: 100.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(19.0),
                gradient: LinearGradient(
                  colors: [
                    Colors.yellow,
                    Colors.orangeAccent,
                    Colors.redAccent,
                    Colors.lime,
                  ],
                  transform: GradientRotation(math.pi / 4),
                  stops: <double>[0.0, 0.5, 0.75, 1.0],
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Safety score",
                        style: Theme.of(context).textTheme.headlineLarge!
                            .copyWith(color: Colors.white),
                      ),
                      Text(
                        "${homeViewmodelProvider.accounts.length} Passwords",
                        style: Theme.of(context).textTheme.headlineSmall!
                            .copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                  Stack(
                    children: [
                      ProgressIndicatorTheme(
                        data: ProgressIndicatorThemeData(
                          color: Colors.orange,
                          strokeWidth: 14.0,
                          circularTrackColor: Colors.white30,
                          constraints: BoxConstraints(
                            minHeight: 60.0,
                            minWidth: 60.0,
                          ),
                        ),
                        child: CircularProgressIndicator.adaptive(
                          value: homeViewmodelProvider.accounts.length * 0.02,
                        ),
                      ),
                      Positioned(
                        top: 0,
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Center(
                          child: Text(
                            "${homeViewmodelProvider.accounts.length * 2}%",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
    );
  }

  SliverAppBar tabBar(BuildContext context) {
    return SliverAppBar(
      scrolledUnderElevation: 0.0,
      automaticallyImplyLeading: false,
      elevation: 0,
      pinned: true,
      expandedHeight: 100.0,
      collapsedHeight: 100.0,
      flexibleSpace: Column(
        spacing: 10.0,
        children: [
          Row(
            children: [
              SizedBox(width: 12.0),
              Text(
                "Categories",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ],
          ),
          TabBar(
            controller: tabController,
            tabs: [
              Tab(
                child: TabButton(icon: LucideIcons.grid2x2, text: "All"),
              ),
              Tab(
                child: TabButton(icon: LucideIcons.logIn, text: "Login"),
              ),
              Tab(
                child: TabButton(icon: LucideIcons.creditCard, text: "Cards"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
