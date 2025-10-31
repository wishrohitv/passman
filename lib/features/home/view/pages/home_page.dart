import 'package:flutter/material.dart';
import 'package:passman/features/home/models/account_model.dart';
import 'package:passman/features/home/models/card_model.dart';
import 'package:passman/features/home/view/widgets/card_preview.dart';
import 'package:passman/features/home/view/widgets/custom_app_bar.dart';
import 'package:passman/features/home/view/widgets/login_tile_card.dart';
import 'package:passman/features/home/viewmodel/home_viewmodel.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController _tabController;
  List<Iterable<dynamic>> savedAccount = [];
  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final homeAuthviewmoderProvider = Provider.of<HomeViewmodel>(
      context,
      listen: true,
    );

    return SafeArea(
      child: CustomAppBar(
        tabController: _tabController,
        body: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              spacing: 12.0,
              children: [
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      Column(
                        children: [
                          Align(
                            alignment: AlignmentGeometry.centerLeft,
                            child: Text(
                              "Recently Added",
                              style: Theme.of(context).textTheme.titleMedium!
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Expanded(
                            child: ListView(
                              padding: EdgeInsets.symmetric(vertical: 6.0),
                              children: homeAuthviewmoderProvider.accounts.map((
                                model,
                              ) {
                                if (model.runtimeType == AccountModel) {
                                  final accounts = model as AccountModel;
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: LoginTileCard(
                                      accountModel: accounts,
                                    ),
                                  );
                                } else if (model.runtimeType == CardModel) {
                                  return CardPreview(
                                    cardModel: model as CardModel,
                                  );
                                } else {
                                  return Container();
                                }
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                      // Logins only
                      Column(
                        children: [
                          Expanded(
                            child: ListView(
                              padding: EdgeInsets.symmetric(vertical: 6.0),
                              children: homeAuthviewmoderProvider.accounts.map((
                                model,
                              ) {
                                if (model.runtimeType == AccountModel) {
                                  final accounts = model as AccountModel;
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: LoginTileCard(
                                      accountModel: accounts,
                                    ),
                                  );
                                } else {
                                  return Container();
                                }
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                      // Cards only
                      Column(
                        children: [
                          Expanded(
                            child: ListView(
                              padding: EdgeInsets.symmetric(vertical: 6.0),
                              children: homeAuthviewmoderProvider.accounts.map((
                                model,
                              ) {
                                if (model.runtimeType == CardModel) {
                                  return CardPreview(
                                    cardModel: model as CardModel,
                                  );
                                } else {
                                  return Container();
                                }
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
