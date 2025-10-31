import 'package:flutter/material.dart';
import 'package:passman/features/home/models/card_model.dart';
import 'package:passman/features/home/viewmodel/home_viewmodel.dart';
import 'package:provider/provider.dart';

class CardPreview extends StatelessWidget {
  final CardModel cardModel;
  const CardPreview({super.key, required this.cardModel});

  @override
  Widget build(BuildContext context) {
    final accounts = Provider.of<HomeViewmodel>(context, listen: false);
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
                  accounts.deleteAccounts(cardModel.id);

                  Navigator.pop(context);
                },
                child: Text("Delete", style: TextStyle(color: Colors.red)),
              ),
            ],
          ),
        );
      },
      child: Column(
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
                    cardModel.bankName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    cardModel.holderName,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(height: 60.0),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    cardModel.cardNumber,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      cardModel.expiryDate,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      cardModel.cvvPin,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [Text("Green pin"), SelectableText(cardModel.greenPin)],
          ),
        ],
      ),
    );
  }
}
