import 'package:flutter/material.dart';
import 'package:simple_wallet_app/data.dart';
import 'package:simple_wallet_app/models/e_card.dart';
import 'package:simple_wallet_app/models/transaction.dart';
import 'package:simple_wallet_app/styles.dart';
import '../widgets/custom_icon_button.dart';
import '../widgets/my_card.dart';
import 'package:intl/intl.dart';

class CardDetailsScreen extends StatefulWidget {
  const CardDetailsScreen({
    Key key,
    this.card,
    this.gradient,
  }) : super(key: key);
  final ECard card;
  final LinearGradient gradient;

  @override
  _CardDetailsScreenState createState() => _CardDetailsScreenState();
}

class _CardDetailsScreenState extends State<CardDetailsScreen> {
  double _totalExpense = 0;
  double _totalIncome = 0;
  String _chosenValue;

  @override
  void initState() {
    _totalIncome = _calculateTotalIncome(card: widget.card);
    _totalExpense = _calculateTotalExpense(card: widget.card);
    _chosenValue = months[widget.card.transactions[0].transactionDate.month];
    super.initState();
  }

  TextStyle _generateTextStyle({
    Color color: Colors.white,
    double fontSize: 16.0,
    FontWeight fontWeight: FontWeight.w600,
  }) {
    return TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        letterSpacing: .7);
  }

  double _calculateTotalExpense({ECard card}) {
    double res = 0;
    card.transactions.forEach((transaction) {
      if (transaction.transactionType == TransactionType.expense)
        res -= transaction.transactionAmount;
    });

    return res;
  }

  double _calculateTotalIncome({ECard card}) {
    double res = 0;
    card.transactions.forEach((transaction) {
      if (transaction.transactionType == TransactionType.income)
        res += transaction.transactionAmount;
    });

    return res;
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: _size.width,
        height: _size.height,
        color: AppColor.background,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomIconButton(
                      icon: Icons.chevron_left_sharp,
                      onPressed: () => Navigator.pop(context),
                    ),
                    SizedBox(height: 20.0),
                    Hero(
                      tag: widget.card.transactions[0].transactionDate,
                      child: MyCard(
                        card: widget.card,
                        gradient: widget.gradient,
                      ),
                    ),
                    SizedBox(height: 30.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Total Expense',
                              style: _generateTextStyle(color: Colors.white70),
                            ),
                            Text(
                              '\u20AC ${_totalExpense.toStringAsFixed(2)}',
                              style: _generateTextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: 40.0,
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(.4),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              iconEnabledColor: Colors.white,
                              value: _chosenValue,
                              items: months
                                  .map<DropdownMenuItem<String>>((String item) {
                                return DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(item),
                                );
                              }).toList(),
                              onChanged: (String value) {
                                setState(() => _chosenValue = value);
                              },
                              selectedItemBuilder: (context) {
                                return months
                                    .map(
                                      (month) => Center(
                                        child: Text(
                                          month,
                                          style: _generateTextStyle(
                                              color: Colors.white),
                                        ),
                                      ),
                                    )
                                    .toList();
                              },
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Total income',
                              style: _generateTextStyle(color: Colors.white70),
                            ),
                            Text(
                              '\u20AC ${_totalIncome.toStringAsFixed(2)}',
                              style: _generateTextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        offset: Offset(-5.0, 0.0),
                        blurRadius: 10.0,
                        spreadRadius: 10.0,
                      ),
                    ]),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 25.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Recent Transactions',
                            style: _generateTextStyle(color: Colors.black),
                          ),
                          Icon(
                            Icons.more_horiz_sharp,
                            size: 32.0,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.greenAccent,
                        child: ListView.builder(
                          physics: BouncingScrollPhysics(),
                          itemCount: widget.card.transactions.length,
                          itemBuilder: (BuildContext context, int index) {
                            Transaction _current =
                                widget.card.transactions[index];
                            return ListTile(
                              title: Text(
                                _current.transactionName,
                                style: _generateTextStyle(color: Colors.black),
                              ),
                              subtitle: Text(
                                  _formatDate(date: _current.transactionDate)),
                              trailing: _current.transactionType ==
                                      TransactionType.expense
                                  ? Text(
                                      '- ${_current.transactionAmount.toString()}',
                                      style: _generateTextStyle(
                                        color: Colors.red,
                                      ),
                                    )
                                  : Text(
                                      '${_current.transactionAmount.toString()}',
                                      style: _generateTextStyle(
                                          color: Colors.green)),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatDate({DateTime date}) => DateFormat.yMMMEd().format(date);
}
