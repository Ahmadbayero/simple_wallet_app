import 'package:flutter/material.dart';
import 'package:simple_wallet_app/data.dart';
import 'package:simple_wallet_app/styles.dart';
import '../widgets/custom_icon_button.dart';
import '../widgets/my_card.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: _size.width,
        height: _size.height,
        color: AppColor.background,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: Text(
                    'My Wallet',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ),
                Container(
                  width: _size.width,
                  height: _size.height * .73, // 73% of the screen's height
                  child: Stack(
                    children: [
                      for (int i = 0; i < myCards.length; i++)
                        if (i == 0)
                          Hero(
                            tag: myCards[i].transactions[0].transactionDate,
                            child: MyCard(
                              gradient: cardColors[i],
                              card: myCards[i],
                            ),
                          )
                        else
                          Positioned(
                            top: ((_size.height * .73) * .25) * i,
                            left: 0,
                            right: 0,
                            child: Hero(
                              tag: myCards[i].transactions[0].transactionDate,
                              child: MyCard(
                                  gradient: cardColors[i], card: myCards[i]),
                            ),
                          ),
                    ],
                  ),
                ),
                Center(
                  child: CustomIconButton(
                    icon: Icons.add_circle_outline_sharp,
                    onPressed: () {},
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
