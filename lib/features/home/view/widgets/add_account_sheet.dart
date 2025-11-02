import 'dart:io';
import 'package:flutter/material.dart';
import 'package:passman/core/provider/settings_provider.dart';
import 'package:passman/core/utils/show_toast.dart';
import 'package:passman/features/home/enum/account_category_enum.dart';
import 'package:passman/features/home/view/widgets/card_number_field.dart';
import 'package:passman/features/home/view/widgets/datepicker_field.dart';
import 'package:passman/features/home/view/widgets/styled_field.dart';
import 'package:passman/features/home/viewmodel/home_viewmodel.dart';
import 'package:passman/l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:unixtime/unixtime.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:passman/core/widgets/custom_button.dart';
import 'package:passman/features/home/enum/account_type_enum.dart';
import 'package:passman/features/home/models/account_model.dart';
import 'package:passman/features/home/models/card_model.dart';
import 'package:passman/features/home/view/widgets/custom_field.dart';
import 'package:passman/features/home/view/widgets/custom_field_multiline.dart';

class AddAccountSheet extends StatefulWidget {
  const AddAccountSheet({super.key});

  @override
  State<AddAccountSheet> createState() => _AddAccountSheetState();
}

class _AddAccountSheetState extends State<AddAccountSheet>
    with TickerProviderStateMixin {
  late TabController _tabController;
  late AnimationController _animationController;
  final TextEditingController _accountTypeTextController =
      TextEditingController();
  final TextEditingController _siteNameTextController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passordController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();
  IconData accountIconData = Icons.person_add_alt_1;

  // Card form objects
  late List<FocusNode> _focusNode;
  final _formCardKey = GlobalKey<FormState>();
  final TextEditingController _bankNameController = TextEditingController();
  final TextEditingController _holderNameController = TextEditingController();
  final TextEditingController _cvvPinController = TextEditingController();
  final TextEditingController _greenPinController = TextEditingController();
  final TextEditingController _cardNoteController = TextEditingController();
  List<String> cardNumbers = [];
  List<String> cardExp = [];
  IconData? siteIconData;
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    _animationController = AnimationController(vsync: this, duration: null);
    _focusNode = List.generate(4, (index) => FocusNode());
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _animationController.dispose();
    _accountTypeTextController.dispose();
    _siteNameTextController.dispose();
    _emailController.dispose();
    _passordController.dispose();
    _noteController.dispose();
    _bankNameController.dispose();
    _holderNameController.dispose();
    _cvvPinController.dispose();
    _greenPinController.dispose();
    _cardNoteController.dispose();
    _focusNode.forEach((foucNode) => foucNode.dispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    return BottomSheet(
      constraints: BoxConstraints(maxHeight: 520.0, minHeight: 400.0),
      animationController: _animationController,
      onClosing: () {},
      builder: (context) {
        return SafeArea(
          child: Column(
            spacing: 16.0,
            children: [
              SizedBox(height: 8.0),
              Text(
                localization.addAccounts,
                style: Theme.of(
                  context,
                ).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
              ),
              TabBar(
                controller: _tabController,
                tabs: [
                  Tab(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [Icon(LucideIcons.logIn300), Text(localization.login,)],
                    ),
                  ),
                  Tab(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [Icon(LucideIcons.creditCard), Text(localization.card)],
                    ),
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          spacing: 10.0,
                          children: [
                            SizedBox(height: 6.0),
                            DropdownMenuFormField(
                              controller: _accountTypeTextController,
                              textInputAction: TextInputAction.next,
                              width: double.maxFinite,
                              leadingIcon: Icon(accountIconData),
                              label: Text(localization.accountType),
                              onSelected: (value) {
                                setState(() {
                                  accountIconData = value!;
                                });
                              },
                              dropdownMenuEntries: [
                                ...AccountTypeEnum.values.map(
                                  (value) => DropdownMenuEntry(
                                    leadingIcon: Icon(value.accountType.iconData),
                                    value: value.accountType.iconData,
                                    label: value.accountType.typeName
                                        .toUpperCase(),
                                  ),
                                ),
                              ],
                            ),
          
                            Row(
                              spacing: 8.0,
                              children: [
                                Expanded(
                                  child: CustomField(
                                    controller: _siteNameTextController,
                                    textInputAction: TextInputAction.next,
                                    helperText:
                                        localization.siteNameHelperText,
                                  ),
                                ),
                                IconButton(
                                  style: ButtonStyle(
                                    fixedSize: WidgetStatePropertyAll(
                                      Size(46.0, 46.0),
                                    ),
                                    shape: WidgetStatePropertyAll(
                                      RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadiusGeometry.circular(14.0),
                                      ),
                                    ),
                                  ),
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) => Dialog(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadiusGeometry.circular(12.0),
                                        ),
                                        constraints: BoxConstraints(
                                          maxHeight: 400.0,
                                        ),
                                        child: GridView.builder(
                                          padding: EdgeInsets.all(12.0),
                                          itemCount:
                                              AccountCategoryEnum.values.length,
                                          scrollDirection: Axis.vertical,
                                          gridDelegate:
                                              SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 4,
                                                mainAxisSpacing: 6.0,
                                                crossAxisSpacing: 6.0,
                                              ),
                                          itemBuilder: (context, index) {
                                            final iconData =
                                                AccountCategoryEnum.values[index];
                                            return IconButton.outlined(
                                              onPressed: () {
                                                _siteNameTextController.value =
                                                    TextEditingValue(
                                                      text: iconData
                                                          .accountCategoryType
                                                          .name,
                                                    );
                                                siteIconData = iconData
                                                    .accountCategoryType
                                                    .iconData;
          
                                                Navigator.pop(context);
                                                setState(() {});
                                              },
                                              icon: Icon(
                                                iconData
                                                    .accountCategoryType
                                                    .iconData,
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    );
                                  },
                                  icon: Icon(siteIconData ?? Icons.add),
                                ),
                              ],
                            ),
          
                            CustomField(
                              textInputAction: TextInputAction.next,
                              controller: _emailController,
                              helperText: localization.emailUserNameNumberHelperText,
                            ),
                            CustomField(
                              textInputAction: TextInputAction.next,
                              controller: _passordController,
                              helperText: localization.password,
                              suffixEye: true,
                              obscure: true,
                            ),
                            SizedBox(
                              height: 80.0,
                              child: CustomFieldMultiline(
                                textInputAction: TextInputAction.next,
                                controller: _noteController,
                                helperText: localization.writeNoteHelperText,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Card field
                    SingleChildScrollView(
                      child: Form(
                        key: _formCardKey,
                        child: Column(
                          spacing: 12.0,
                          children: [
                            Container(
                              height: 212.0,
                              width: double.maxFinite,
                              margin: EdgeInsets.all(8.0),
                              padding: EdgeInsets.only(
                                left: 16.0,
                                right: 16.0,
                                bottom: 16.0,
                              ),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("assets/card_mockup.png"),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Column(
                                children: [
                                  SizedBox(height: 8.0),
                                  StyledField(
                                    hintText: localization.bankName,
                                    textCapitalization:
                                        TextCapitalization.characters,
                                    controller: _bankNameController,
                                    textInputAction: TextInputAction.next,
                                    focusNode: _focusNode[0],
                                  ),
                                  StyledField(
                                    hintText: localization.holderName,
                                    controller: _holderNameController,
                                    textCapitalization:
                                        TextCapitalization.characters,
                                    textInputAction: TextInputAction.next,
                                    focusNode: _focusNode[1],
                                  ),
                                  SizedBox(
                                    height: Platform.isAndroid || Platform.isIOS
                                        ? 36.0
                                        : 70.0,
                                  ),
                                  // Card number field
                                  CardNumberField(
                                    inputFieldLength: 4,
          
                                    cardNumber: (_cardNumber) {
                                      cardNumbers = _cardNumber;
                                    },
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: 166.0,
                                        child: Row(
                                          children: [
                                            Text("Expire on "),
                                            DatepickerField(
                                              expDate: (expDate) {
                                                cardExp = expDate;
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                      // Cvv pin
                                      Row(
                                        spacing: 8.0,
                                        children: [
                                          Text("CVV"),
                                          SizedBox(
                                            width: 40.0,
                                            child: StyledField(
                                              keyboardType: TextInputType.number,
                                              maxLength: 3,
                                              controller: _cvvPinController,
                                              hintText: "000",
                                              textInputAction:
                                                  TextInputAction.next,
                                              focusNode: _focusNode[2],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(localization.greenPin),
                                SizedBox(
                                  width: 140.0,
                                  child: CustomField(
                                    textInputAction: TextInputAction.done,
                                    controller: _greenPinController,
                                    obscure: true,
                                    suffixEye: true,
                                    focusNode: _focusNode[3],
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.all(16.0),
                              height: 80.0,
                              child: CustomFieldMultiline(
                                textInputAction: TextInputAction.next,
                                controller: _cardNoteController,
                                helperText: localization.writeNoteHelperText,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              CustomButton(
                onPressed: () async {
                  final randomID = DateTime.now().unixtime;
          
                  try {
                    if (_tabController.index == 0) {
                      addAccount(randomID);
                    } else if (_tabController.index == 1) {
                      addCard(randomID);
                    }
                    showNotification(localization.addSuccessfully);
                  } on Exception catch (_) {
                    showToast(localization.somethingWentWrong);
                  }
                  Navigator.pop(context);
                },
                text: localization.add,
              ),
              SizedBox(height: 8.0),
            ],
          ),
        );
      },
    );
  }

  void addAccount(int id) async {
    final homeViewmodel = Provider.of<HomeViewmodel>(context, listen: false);
    final account = AccountModel();

    account
      ..email = _emailController.text
      ..siteName = _siteNameTextController.text
      ..id = id
      ..password = (await homeViewmodel.encryptData(_passordController.text))!
      ..note = _noteController.text
      ..encryptionAlgorithm =
          SettingsProvider().selectedEncryptionAlgorithm.name
      ..icon = siteIconData == null ? "" : _siteNameTextController.text
      ..accountType = _accountTypeTextController.text.isEmpty
          ? AccountTypeEnum.values
                .byName(_accountTypeTextController.text)
                .toString()
          : _accountTypeTextController.text;
    homeViewmodel.addAccount(id, account);
  }

  void addCard(int id) async {
    final homeViewmodel = Provider.of<HomeViewmodel>(context, listen: false);
    final card = CardModel();
    card
      ..id = id
      ..bankName = _bankNameController.text.toUpperCase()
      ..holderName = _holderNameController.text
      ..cardNumber = (await homeViewmodel.encryptData(cardNumbers.toString()))!
      ..expiryDate = (await homeViewmodel.encryptData(
        [int.parse(cardExp[1]), int.parse(cardExp[0])].toString(),
      ))!
      ..cvvPin = (await homeViewmodel.encryptData(_cvvPinController.text))!
      ..greenPin = (await homeViewmodel.encryptData(_greenPinController.text))!
      ..note = _cardNoteController.text
      ..encryptionAlgorithm =
          SettingsProvider().selectedEncryptionAlgorithm.name;
    homeViewmodel.addAccount(id, card);
  }
}
