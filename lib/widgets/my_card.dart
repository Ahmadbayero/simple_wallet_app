import 'package:flutter/material.dart';
import 'package:simple_wallet_app/models/e_card.dart';
import './master_card_logo.dart';
import '../screens/card_details_screen.dart';

class MyCard extends StatelessWidget {
  const MyCard({
    Key key,
    @required this.gradient,
    @required this.card,
  }) : super(key: key);

  final LinearGradient gradient;
  final ECard card;

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => CardDetailsScreen(
            card: card,
            gradient: gradient,
          ),
        ),
      ),
      child: Container(
        padding: EdgeInsets.all(20.0),
        width: double.infinity,
        height: (_size.height * .28),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            gradient: gradient,
            boxShadow: [
              BoxShadow(
                  color: Colors.black54,
                  offset: Offset(0.0, 5.0),
                  blurRadius: 10.0,
                  spreadRadius: 5.0),
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              card.bankName,
              style: Theme.of(context).textTheme.headline6,
            ),
            Text(
              card.cardNumber,
              style: Theme.of(context).textTheme.headline4,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  card.cardHolderName,
                  style: Theme.of(context).textTheme.headline6,
                ),
                if (card.cardType == 'Master card') MasterCardLogo(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
