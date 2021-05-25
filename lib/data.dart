import 'package:simple_wallet_app/models/e_card.dart';
import 'package:simple_wallet_app/models/transaction.dart';

List<ECard> myCards = [
  ECard(
      bankName: 'La Poste First',
      cardNumber: '3321 **** **** 1498',
      cardHolderName: 'Pablo Escober',
      cardType: 'Master card',
      transactions: myTransactions[0]),
  ECard(
      bankName: 'Business GoldBank',
      cardNumber: '8756 **** **** 1999',
      cardHolderName: 'Pablo Gomez',
      cardType: 'Master card',
      transactions: myTransactions[1]),
  ECard(
      bankName: 'Premium Agricole',
      cardNumber: '6949 **** **** 9876',
      cardHolderName: 'Robert Durio',
      cardType: 'Master card',
      transactions: myTransactions[2]),
];

List<List<Transaction>> myTransactions = [
  [
    Transaction(
      transactionName: 'McDonalds',
      transactionDate: DateTime(2020, 6, 31),
      transactionAmount: 21.40,
      transactionType: TransactionType.expense,
    ),
    Transaction(
      transactionName: 'Salary',
      transactionDate: DateTime(2020, 6, 31),
      transactionAmount: 2500,
      transactionType: TransactionType.income,
    ),
    Transaction(
      transactionName: 'Cinema',
      transactionDate: DateTime(2020, 6, 30),
      transactionAmount: 13.43,
      transactionType: TransactionType.expense,
    ),
    Transaction(
      transactionName: 'Netflix',
      transactionDate: DateTime(2020, 6, 30),
      transactionAmount: 19.99,
      transactionType: TransactionType.expense,
    ),
  ],
  [
    Transaction(
      transactionName: 'McDonalds',
      transactionDate: DateTime(2020, 7, 31),
      transactionAmount: 25.40,
      transactionType: TransactionType.expense,
    ),
    Transaction(
      transactionName: 'Salary',
      transactionDate: DateTime(2020, 7, 31),
      transactionAmount: 3000,
      transactionType: TransactionType.income,
    ),
    Transaction(
      transactionName: 'Cinema',
      transactionDate: DateTime(2020, 7, 30),
      transactionAmount: 15.43,
      transactionType: TransactionType.expense,
    ),
    Transaction(
      transactionName: 'Netflix',
      transactionDate: DateTime(2020, 7, 30),
      transactionAmount: 20.99,
      transactionType: TransactionType.expense,
    ),
  ],
  [
    Transaction(
      transactionName: 'McDonalds',
      transactionDate: DateTime(2020, 8, 31),
      transactionAmount: 21.40,
      transactionType: TransactionType.expense,
    ),
    Transaction(
      transactionName: 'Salary',
      transactionDate: DateTime(2020, 8, 31),
      transactionAmount: 2500,
      transactionType: TransactionType.income,
    ),
    Transaction(
      transactionName: 'Cinema',
      transactionDate: DateTime(2020, 8, 30),
      transactionAmount: 13.43,
      transactionType: TransactionType.expense,
    ),
    Transaction(
      transactionName: 'Netflix',
      transactionDate: DateTime(2020, 8, 30),
      transactionAmount: 19.99,
      transactionType: TransactionType.expense,
    ),
  ]
];

List<String> months = [
  'January',
  'Febuary',
  'March',
  'April',
  'May',
  'June',
  'July',
  'August',
  'September',
  'October',
  'November',
  'December',
];