import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:passman/core/utils/loader.dart';
import 'package:passman/core/widgets/circular_loader.dart';
import 'package:passman/features/home/models/card_model.dart';
import 'package:passman/features/home/viewmodel/home_viewmodel.dart';
import 'package:provider/provider.dart';

class CardPreview extends StatefulWidget {
  final CardModel cardModel;
  const CardPreview({super.key, required this.cardModel});

  @override
  State<CardPreview> createState() => _CardPreviewState();
}

class _CardPreviewState extends State<CardPreview> {
  bool obscure = true;
  @override
  Widget build(BuildContext context) {
    final homeViewmodelProvider = Provider.of<HomeViewmodel>(
      context,
      listen: false,
    );
    return InkWell(
      onLongPress: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("Delete"),
            content: Text("This action can't be undone"),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text("Cancel"),
              ),
              TextButton(
                onPressed: () {
                  homeViewmodelProvider.deleteAccounts(widget.cardModel.id);

                  Navigator.pop(context);
                },
                child: Text("Delete", style: TextStyle(color: Colors.red)),
              ),
            ],
          ),
        );
      },
      child: Stack(
        children: [
          // Card
          Column(
            children: [
              Container(
                height: 200.0,
                width: double.maxFinite,
                margin: EdgeInsets.all(8.0),
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/card_mockup.png"),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        widget.cardModel.bankName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.headlineSmall!
                            .copyWith(fontWeight: FontWeight.w700),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        widget.cardModel.holderName,
                        style: Theme.of(context).textTheme.titleMedium!
                            .copyWith(fontWeight: FontWeight.w400),
                      ),
                    ),
                    SizedBox(height: 60.0),

                    Align(
                      alignment: Alignment.center,
                      child: FutureBuilder(
                        future: homeViewmodelProvider.decryptData(
                          widget.cardModel.cardNumber,
                        ),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return CircularLoader();
                          } else {
                            if (snapshot.hasData && snapshot.data != null) {
                              final asList = jsonDecode(snapshot.data!);
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                spacing: 6.0,
                                children: [
                                  Text(
                                    "${obscureBuilder(asList.first.toString())} ${obscureBuilder(asList[1].toString())} ${obscureBuilder(asList[2].toString())}  ${obscureBuilder(asList.last.toString())}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(fontWeight: FontWeight.w400),
                                  ),
                                  copyClipboard(
                                    "${asList.first}${asList[1]}${asList[2]}${asList.last}",
                                  ),
                                ],
                              );
                            } else {
                              return Text(
                                "Error",
                                style: Theme.of(context).textTheme.titleMedium!
                                    .copyWith(
                                      fontWeight: FontWeight.w400,
                                      color: Colors.red,
                                    ),
                              );
                            }
                          }
                        },
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        FutureBuilder(
                          future: homeViewmodelProvider.decryptData(
                            widget.cardModel.expiryDate,
                          ),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return CircularLoader();
                            } else {
                              if (snapshot.hasData && snapshot.data != null) {
                                final asList = jsonDecode(snapshot.data!);
                                return Text(
                                  "Expire ${obscureBuilder(asList[1].toString())}/${obscureBuilder(asList.first.toString())}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(fontWeight: FontWeight.w400),
                                );
                              } else {
                                return Text("Error");
                              }
                            }
                          },
                        ),
                        FutureBuilder(
                          future: homeViewmodelProvider.decryptData(
                            widget.cardModel.cvvPin,
                          ),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return CircularLoader();
                            } else {
                              if (snapshot.hasData && snapshot.data != null) {
                                return Row(
                                  spacing: 6.0,
                                  children: [
                                    Text(
                                      "CVV ${obscureBuilder(snapshot.data!)}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .copyWith(
                                            fontWeight: FontWeight.w400,
                                          ),
                                    ),
                                    copyClipboard(snapshot.data!),
                                  ],
                                );
                              } else {
                                return Text("Error");
                              }
                            }
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Green pin"),
                  FutureBuilder(
                    future: homeViewmodelProvider.decryptData(
                      widget.cardModel.greenPin,
                    ),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularLoader();
                      } else {
                        if (snapshot.hasData && snapshot.data != null) {
                          return Row(
                            spacing: 6.0,
                            children: [
                              SelectableText(obscureBuilder(snapshot.data!)),
                              copyClipboard(snapshot.data!),
                            ],
                          );
                        } else {
                          return Text("Error");
                        }
                      }
                    },
                  ),
                ],
              ),
            ],
          ),

          // Visible toogle
          Positioned(
            right: 2,
            top: 2,
            child: IconButton(
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.transparent),
                iconColor: WidgetStatePropertyAll(
                  const Color.fromARGB(141, 0, 0, 0),
                ),
              ),
              onPressed: () {
                setState(() {
                  obscure = !obscure;
                });
              },
              icon: Icon(
                obscure
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
              ),
            ),
          ),
        ],
      ),
    );
  }

  String obscureBuilder(String text) {
    if (obscure) {
      return "*" * text.length;
    } else {
      return text;
    }
  }

  Widget copyClipboard(String text) {
    return InkWell(
      onTap: () {
        Clipboard.setData(ClipboardData(text: text));
        Loader().showLoader(
          context,
          widget: Column(
            mainAxisSize: MainAxisSize.min,
            children: [Icon(Icons.check), Text("Coppied")],
          ),
        );
      },
      child: Icon(Icons.copy, size: 18.0),
    );
  }
}
